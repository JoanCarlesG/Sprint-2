-- MySQL Script generated by MySQL Workbench
-- Mon Dec 12 09:33:03 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`direccions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`direccions` (
  `direccions_id` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NULL,
  `num` INT NULL,
  `pis` INT NULL,
  `porta` VARCHAR(45) NULL,
  `codi_postal` INT NULL,
  `localitat` VARCHAR(45) NULL,
  `provincia` VARCHAR(45) NULL,
  PRIMARY KEY (`direccions_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`pizzeria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pizzeria` (
  `pizzeria_id` INT NOT NULL AUTO_INCREMENT,
  `direccions_id` INT NOT NULL,
  PRIMARY KEY (`pizzeria_id`, `direccions_id`),
  INDEX `fk_pizzeria_direccions1_idx` (`direccions_id` ASC) VISIBLE,
  CONSTRAINT `fk_pizzeria_direccions1`
    FOREIGN KEY (`direccions_id`)
    REFERENCES `pizzeria`.`direccions` (`direccions_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`clients` (
  `clients_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `cognom1` VARCHAR(45) NULL,
  `cognom2` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `direccions_id` INT NOT NULL,
  PRIMARY KEY (`clients_id`, `direccions_id`),
  INDEX `fk_clients_direccions_idx` (`direccions_id` ASC) VISIBLE,
  CONSTRAINT `fk_clients_direccions`
    FOREIGN KEY (`direccions_id`)
    REFERENCES `pizzeria`.`direccions` (`direccions_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`categoria_pizzes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`categoria_pizzes` (
  `categoria_pizzes_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`categoria_pizzes_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pizza` (
  `pizza_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(20) NULL,
  `descripcio` VARCHAR(45) NULL,
  `imatge` BLOB NULL,
  `preu` DECIMAL(2) NULL,
  `categoria_pizzes_id` INT NOT NULL,
  PRIMARY KEY (`pizza_id`, `categoria_pizzes_id`),
  INDEX `fk_pizza_categoria_pizzes1_idx` (`categoria_pizzes_id` ASC) VISIBLE,
  CONSTRAINT `fk_pizza_categoria_pizzes1`
    FOREIGN KEY (`categoria_pizzes_id`)
    REFERENCES `pizzeria`.`categoria_pizzes` (`categoria_pizzes_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`hamburguesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`hamburguesa` (
  `hamburguesa_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(20) NULL,
  `descripcio` VARCHAR(45) NULL,
  `imatge` BLOB NULL,
  `preu` DECIMAL(2) NULL,
  PRIMARY KEY (`hamburguesa_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`beguda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`beguda` (
  `beguda_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(20) NULL,
  `descripcio` VARCHAR(45) NULL,
  `imatge` BLOB NULL,
  `preu` DECIMAL(2) NULL,
  PRIMARY KEY (`beguda_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`comanda` (
  `comanda_id` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NULL,
  `tipus` ENUM('domicili', 'botiga') NULL COMMENT '2 valors possibles: botiga o domicili',
  `pizzes` INT NULL,
  `hamburgueses` INT NULL,
  `begudes` INT NULL,
  `preu_total` DECIMAL(2) NULL,
  `clients_id` INT NOT NULL,
  `pizzeria_id` INT NOT NULL,
  `hora_repartiment` DATETIME NULL,
  `pizza_id` INT NOT NULL,
  `hamburguesa_id` INT NOT NULL,
  `beguda_id` INT NOT NULL,
  PRIMARY KEY (`comanda_id`, `clients_id`, `pizzeria_id`, `pizza_id`, `hamburguesa_id`, `beguda_id`),
  INDEX `fk_comanda_clients1_idx` (`clients_id` ASC) VISIBLE,
  INDEX `fk_comanda_pizzeria1_idx` (`pizzeria_id` ASC) VISIBLE,
  INDEX `fk_comanda_pizza1_idx` (`pizza_id` ASC) VISIBLE,
  INDEX `fk_comanda_hamburguesa1_idx` (`hamburguesa_id` ASC) VISIBLE,
  INDEX `fk_comanda_beguda1_idx` (`beguda_id` ASC) VISIBLE,
  CONSTRAINT `fk_comanda_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `pizzeria`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_pizzeria1`
    FOREIGN KEY (`pizzeria_id`)
    REFERENCES `pizzeria`.`pizzeria` (`pizzeria_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_pizza1`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `pizzeria`.`pizza` (`pizza_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_hamburguesa1`
    FOREIGN KEY (`hamburguesa_id`)
    REFERENCES `pizzeria`.`hamburguesa` (`hamburguesa_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_beguda1`
    FOREIGN KEY (`beguda_id`)
    REFERENCES `pizzeria`.`beguda` (`beguda_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`client_fa_comandes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`client_fa_comandes` (
  `client_fa_comandes_id` INT NOT NULL AUTO_INCREMENT,
  `clients_id` INT NOT NULL,
  `comanda_id` INT NOT NULL,
  PRIMARY KEY (`client_fa_comandes_id`, `clients_id`, `comanda_id`),
  INDEX `fk_client_fa_comandes_clients1_idx` (`clients_id` ASC) VISIBLE,
  INDEX `fk_client_fa_comandes_comanda1_idx` (`comanda_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_fa_comandes_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `pizzeria`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_client_fa_comandes_comanda1`
    FOREIGN KEY (`comanda_id`)
    REFERENCES `pizzeria`.`comanda` (`comanda_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`empleats` (
  `empleats_id` INT NOT NULL AUTO_INCREMENT,
  `pizzeria_id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognom1` VARCHAR(45) NULL,
  `cognom2` VARCHAR(45) NULL,
  `nif` VARCHAR(9) NULL,
  `telefon` INT NULL,
  `tipus` ENUM('cuiner/a', 'repartidor/a') NULL COMMENT '2 valors possibles: cuiner o repartidor.',
  `comanda_id` INT NOT NULL,
  PRIMARY KEY (`empleats_id`, `pizzeria_id`, `comanda_id`),
  INDEX `fk_empleats_pizzeria1_idx` (`pizzeria_id` ASC) VISIBLE,
  INDEX `fk_empleats_comanda1_idx` (`comanda_id` ASC) VISIBLE,
  CONSTRAINT `fk_empleats_pizzeria1`
    FOREIGN KEY (`pizzeria_id`)
    REFERENCES `pizzeria`.`pizzeria` (`pizzeria_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_empleats_comanda1`
    FOREIGN KEY (`comanda_id`)
    REFERENCES `pizzeria`.`comanda` (`comanda_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;