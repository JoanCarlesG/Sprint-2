-- MySQL Workbench Synchronization
-- Generated: 2022-11-23 12:14
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Juan Carlos Godinez

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `optica`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `optica`.`proveidor` (
  `proveidor_id` INT(11) NOT NULL AUTO_INCREMENT,
  `proveidor_nom` VARCHAR(45) NOT NULL,
  `direccio_id` INT(11) NOT NULL,
  PRIMARY KEY (`proveidor_id`, `direccio_id`),
  INDEX `fk_proveidor_direccio_idx` (`direccio_id` ASC) VISIBLE,
  CONSTRAINT `fk_proveidor_direccio`
    FOREIGN KEY (`direccio_id`)
    REFERENCES `optica`.`direccions` (`direccio_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`direccions` (
  `direccio_id` INT(11) NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NULL DEFAULT NULL,
  `num` INT(11) NULL DEFAULT NULL,
  `pis` INT(11) NULL DEFAULT NULL,
  `porta` INT(11) NULL DEFAULT NULL,
  `ciutat` VARCHAR(45) NULL DEFAULT NULL,
  `codi_postal` INT(11) NULL DEFAULT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  `clients_clients_id` INT(11) NOT NULL,
  PRIMARY KEY (`direccio_id`, `clients_clients_id`),
  INDEX `fk_direccions_clients1_idx` (`clients_clients_id` ASC) VISIBLE,
  CONSTRAINT `fk_direccions_clients1`
    FOREIGN KEY (`clients_clients_id`)
    REFERENCES `optica`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `ulleres_id` INT(11) NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NULL DEFAULT NULL,
  `graduacio_esq` DECIMAL(2) NULL DEFAULT NULL,
  `graduacio_drt` DECIMAL(2) NULL DEFAULT NULL,
  `muntura` VARCHAR(45) NULL DEFAULT NULL,
  `color_muntura` VARCHAR(45) NULL DEFAULT NULL,
  `color_esq` VARCHAR(45) NULL DEFAULT NULL,
  `color_drt` VARCHAR(45) NULL DEFAULT NULL,
  `preu` INT(11) NULL DEFAULT NULL,
  `proveidor_proveidor_id` INT(11) NOT NULL,
  `proveidor_direccio_id` INT(11) NOT NULL,
  PRIMARY KEY (`ulleres_id`),
  INDEX `fk_ulleres_proveidor1_idx` (`proveidor_proveidor_id` ASC, `proveidor_direccio_id` ASC) VISIBLE,
  CONSTRAINT `fk_ulleres_proveidor1`
    FOREIGN KEY (`proveidor_proveidor_id` , `proveidor_direccio_id`)
    REFERENCES `optica`.`proveidor` (`proveidor_id` , `direccio_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`clients` (
  `clients_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `telefon` INT(11) NULL DEFAULT NULL,
  `mail` VARCHAR(45) NULL DEFAULT NULL,
  `registre` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`clients_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`optica` (
  `optica_id` INT(11) NOT NULL AUTO_INCREMENT,
  `empleats_empleats_id` INT(11) NOT NULL,
  `clients_clients_id` INT(11) NOT NULL,
  `proveidor_proveidor_id` INT(11) NOT NULL,
  `proveidor_direccio_id` INT(11) NOT NULL,
  PRIMARY KEY (`optica_id`, `empleats_empleats_id`, `clients_clients_id`, `proveidor_proveidor_id`, `proveidor_direccio_id`),
  INDEX `fk_optica_empleats1_idx` (`empleats_empleats_id` ASC) VISIBLE,
  INDEX `fk_optica_clients1_idx` (`clients_clients_id` ASC) VISIBLE,
  INDEX `fk_optica_proveidor1_idx` (`proveidor_proveidor_id` ASC, `proveidor_direccio_id` ASC) VISIBLE,
  CONSTRAINT `fk_optica_empleats1`
    FOREIGN KEY (`empleats_empleats_id`)
    REFERENCES `optica`.`empleats` (`empleats_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_optica_clients1`
    FOREIGN KEY (`clients_clients_id`)
    REFERENCES `optica`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_optica_proveidor1`
    FOREIGN KEY (`proveidor_proveidor_id` , `proveidor_direccio_id`)
    REFERENCES `optica`.`proveidor` (`proveidor_id` , `direccio_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`client_recomana_client` (
  `client_recomana_client_id` INT(11) NOT NULL AUTO_INCREMENT,
  `clients_clients_id` INT(11) NOT NULL,
  `recomanacions` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`client_recomana_client_id`, `clients_clients_id`),
  INDEX `fk_client_recomana_client_clients1_idx` (`clients_clients_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_recomana_client_clients1`
    FOREIGN KEY (`clients_clients_id`)
    REFERENCES `optica`.`clients` (`clients_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`empleats` (
  `empleats_id` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`empleats_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
