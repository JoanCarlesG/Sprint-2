-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8mb3 ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`direccions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`direccions` (
  `direccio_id` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NULL DEFAULT NULL,
  `num` INT NULL DEFAULT NULL,
  `pis` INT NULL DEFAULT NULL,
  `porta` INT NULL DEFAULT NULL,
  `ciutat` VARCHAR(45) NULL DEFAULT NULL,
  `codi_postal` INT NULL DEFAULT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`direccio_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `optica`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`clients` (
  `clients_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `telefon` INT NULL DEFAULT NULL,
  `mail` VARCHAR(45) NULL DEFAULT NULL,
  `registre` DATETIME NULL DEFAULT NULL,
  `direccio_id` INT NOT NULL,
  PRIMARY KEY (`clients_id`, `direccio_id`),
  INDEX `fk_clients_direccions1_idx` (`direccio_id` ASC) VISIBLE,
  CONSTRAINT `fk_clients_direccions1`
    FOREIGN KEY (`direccio_id`)
    REFERENCES `optica`.`direccions` (`direccio_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `optica`.`client_recomana_client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`client_recomana_client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `client_recomanat` INT NOT NULL,
  PRIMARY KEY (`client_id`, `client_recomanat`),
  INDEX `fk_client_recomana_client_clients1_idx` (`client_recomanat` ASC) VISIBLE,
  CONSTRAINT `fk_client_recomana_client_clients1`
    FOREIGN KEY (`client_recomanat`)
    REFERENCES `optica`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `optica`.`empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleats` (
  `empleats_id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  PRIMARY KEY (`empleats_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `optica`.`proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveidor` (
  `proveidor_id` INT NOT NULL AUTO_INCREMENT,
  `proveidor_nom` VARCHAR(45) NOT NULL,
  `direccio_id` INT NOT NULL,
  PRIMARY KEY (`proveidor_id`, `direccio_id`),
  INDEX `fk_proveidor_direccio_idx` (`direccio_id` ASC) VISIBLE,
  CONSTRAINT `fk_proveidor_direccio`
    FOREIGN KEY (`direccio_id`)
    REFERENCES `optica`.`direccions` (`direccio_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `optica`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `ulleres_id` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NULL DEFAULT NULL,
  `graduacio_esq` DECIMAL(2,0) NULL DEFAULT NULL,
  `graduacio_drt` DECIMAL(2,0) NULL DEFAULT NULL,
  `muntura` ENUM('flotant', 'pasta', 'metalica') NULL DEFAULT NULL,
  `color_muntura` VARCHAR(45) NULL DEFAULT NULL,
  `color_esq` VARCHAR(45) NULL DEFAULT NULL,
  `color_drt` VARCHAR(45) NULL DEFAULT NULL,
  `preu` INT NULL DEFAULT NULL,
  `proveidor_id` INT NOT NULL,
  PRIMARY KEY (`ulleres_id`),
  INDEX `fk_ulleres_proveidor1_idx` (`proveidor_id` ASC) VISIBLE,
  CONSTRAINT `fk_ulleres_proveidor1`
    FOREIGN KEY (`proveidor_id`)
    REFERENCES `optica`.`proveidor` (`proveidor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `optica`.`vendes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`vendes` (
  `vendes_id` INT NOT NULL AUTO_INCREMENT,
  `empleats_id` INT NOT NULL,
  `ulleres_id` INT NOT NULL,
  `clients_id` INT NOT NULL,
  `data` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`vendes_id`, `empleats_id`, `ulleres_id`, `clients_id`),
  INDEX `fk_empleats_has_ulleres_ulleres1_idx` (`ulleres_id` ASC) VISIBLE,
  INDEX `fk_empleats_has_ulleres_empleats1_idx` (`empleats_id` ASC) VISIBLE,
  INDEX `fk_empleats_ven_ulleres_clients1_idx` (`clients_id` ASC) VISIBLE,
  CONSTRAINT `fk_empleats_has_ulleres_empleats1`
    FOREIGN KEY (`empleats_id`)
    REFERENCES `optica`.`empleats` (`empleats_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_empleats_has_ulleres_ulleres1`
    FOREIGN KEY (`ulleres_id`)
    REFERENCES `optica`.`ulleres` (`ulleres_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_empleats_ven_ulleres_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `optica`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
