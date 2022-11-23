-- MySQL Workbench Synchronization
-- Generated: 2022-11-23 13:01
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Juan Carlos Godinez

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`pizzeria` (
  `pizzeria_id` INT(11) NOT NULL AUTO_INCREMENT,
  `direccions_id` INT(11) NOT NULL,
  PRIMARY KEY (`pizzeria_id`, `direccions_id`),
  INDEX `fk_pizzeria_direccions1_idx` (`direccions_id` ASC) VISIBLE,
  CONSTRAINT `fk_pizzeria_direccions1`
    FOREIGN KEY (`direccions_id`)
    REFERENCES `pizzeria`.`direccions` (`direccions_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`clients` (
  `clients_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `cognom1` VARCHAR(45) NULL DEFAULT NULL,
  `cognom2` VARCHAR(45) NULL DEFAULT NULL,
  `telefon` VARCHAR(45) NULL DEFAULT NULL,
  `direccions_id` INT(11) NOT NULL,
  PRIMARY KEY (`clients_id`, `direccions_id`),
  INDEX `fk_clients_direccions_idx` (`direccions_id` ASC) VISIBLE,
  CONSTRAINT `fk_clients_direccions`
    FOREIGN KEY (`direccions_id`)
    REFERENCES `pizzeria`.`direccions` (`direccions_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`direccions` (
  `direccions_id` INT(11) NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NULL DEFAULT NULL,
  `num` INT(11) NULL DEFAULT NULL,
  `pis` INT(11) NULL DEFAULT NULL,
  `porta` VARCHAR(45) NULL DEFAULT NULL,
  `codi_postal` INT(11) NULL DEFAULT NULL,
  `localitat` VARCHAR(45) NULL DEFAULT NULL,
  `provincia` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`direccions_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`client_fa_comandes` (
  `client_fa_comandes_id` INT(11) NOT NULL AUTO_INCREMENT,
  `clients_id` INT(11) NOT NULL,
  `comanda_id` INT(11) NOT NULL,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`comanda` (
  `comanda_id` INT(11) NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NULL DEFAULT NULL,
  `tipus` VARCHAR(8) BINARY NULL DEFAULT NULL COMMENT '2 valors possibles: botiga o domicili',
  `pizzes` INT(11) NULL DEFAULT NULL,
  `hamburgueses` INT(11) NULL DEFAULT NULL,
  `begudes` INT(11) NULL DEFAULT NULL,
  `preu_total` DECIMAL(2) NULL DEFAULT NULL,
  `clients_id` INT(11) NOT NULL,
  `pizzeria_id` INT(11) NOT NULL,
  PRIMARY KEY (`comanda_id`, `clients_id`, `pizzeria_id`),
  INDEX `fk_comanda_clients1_idx` (`clients_id` ASC) VISIBLE,
  INDEX `fk_comanda_pizzeria1_idx` (`pizzeria_id` ASC) VISIBLE,
  CONSTRAINT `fk_comanda_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `pizzeria`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_pizzeria1`
    FOREIGN KEY (`pizzeria_id`)
    REFERENCES `pizzeria`.`pizzeria` (`pizzeria_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`pizza` (
  `pizza_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(20) NULL DEFAULT NULL,
  `descripcio` VARCHAR(45) NULL DEFAULT NULL,
  `imatge` BLOB NULL DEFAULT NULL,
  `preu` DECIMAL(2) NULL DEFAULT NULL,
  `comanda_id` INT(11) NOT NULL,
  `categoria_pizzes_id` INT(11) NOT NULL,
  PRIMARY KEY (`pizza_id`, `comanda_id`, `categoria_pizzes_id`),
  INDEX `fk_pizza_comanda1_idx` (`comanda_id` ASC) VISIBLE,
  INDEX `fk_pizza_categoria_pizzes1_idx` (`categoria_pizzes_id` ASC) VISIBLE,
  CONSTRAINT `fk_pizza_comanda1`
    FOREIGN KEY (`comanda_id`)
    REFERENCES `pizzeria`.`comanda` (`comanda_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pizza_categoria_pizzes1`
    FOREIGN KEY (`categoria_pizzes_id`)
    REFERENCES `pizzeria`.`categoria_pizzes` (`categoria_pizzes_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`hamburguesa` (
  `pizza_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(20) NULL DEFAULT NULL,
  `descripcio` VARCHAR(45) NULL DEFAULT NULL,
  `imatge` BLOB NULL DEFAULT NULL,
  `preu` DECIMAL(2) NULL DEFAULT NULL,
  `comanda_id` INT(11) NOT NULL,
  PRIMARY KEY (`pizza_id`, `comanda_id`),
  INDEX `fk_hamburguesa_comanda1_idx` (`comanda_id` ASC) VISIBLE,
  CONSTRAINT `fk_hamburguesa_comanda1`
    FOREIGN KEY (`comanda_id`)
    REFERENCES `pizzeria`.`comanda` (`comanda_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`beguda` (
  `pizza_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(20) NULL DEFAULT NULL,
  `descripcio` VARCHAR(45) NULL DEFAULT NULL,
  `imatge` BLOB NULL DEFAULT NULL,
  `preu` DECIMAL(2) NULL DEFAULT NULL,
  `comanda_id` INT(11) NOT NULL,
  PRIMARY KEY (`pizza_id`, `comanda_id`),
  INDEX `fk_beguda_comanda1_idx` (`comanda_id` ASC) VISIBLE,
  CONSTRAINT `fk_beguda_comanda1`
    FOREIGN KEY (`comanda_id`)
    REFERENCES `pizzeria`.`comanda` (`comanda_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`categoria_pizzes` (
  `categoria_pizzes_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`categoria_pizzes_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`empleats` (
  `empleats_id` INT(11) NOT NULL AUTO_INCREMENT,
  `pizzeria_id` INT(11) NOT NULL,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `cognom1` VARCHAR(45) NULL DEFAULT NULL,
  `cognom2` VARCHAR(45) NULL DEFAULT NULL,
  `nif` VARCHAR(9) NULL DEFAULT NULL,
  `telefon` INT(11) NULL DEFAULT NULL,
  `tipus` VARCHAR(10) NULL DEFAULT NULL COMMENT '2 valors possibles: cuiner o repartidor.',
  `comanda_id` INT(11) NOT NULL,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
