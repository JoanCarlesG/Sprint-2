-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `users_id` INT NOT NULL AUTO_INCREMENT,
  `mail` VARCHAR(60) NULL DEFAULT NULL,
  `password` VARCHAR(30) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `birthdate` DATETIME NULL DEFAULT NULL,
  `gender` ENUM('male', 'female', 'not specified') NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `zipcode` INT NULL DEFAULT NULL,
  PRIMARY KEY (`users_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`channel` (
  `channel_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` MEDIUMTEXT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`channel_id`, `users_id`),
  INDEX `fk_channel_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`videos` (
  `videos_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `file_name` VARCHAR(45) NULL DEFAULT NULL,
  `size` INT NULL DEFAULT NULL,
  `thumbnail` BLOB NULL DEFAULT NULL,
  `times_played` INT NULL DEFAULT NULL,
  `status` ENUM('public', 'hidden', 'private') NULL DEFAULT NULL,
  `publish_date` DATETIME NULL DEFAULT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`videos_id`, `users_id`),
  INDEX `fk_videos_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_videos_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comments` (
  `comments_id` INT NOT NULL AUTO_INCREMENT,
  `text` MEDIUMTEXT NULL DEFAULT NULL,
  `timestamp` DATETIME NULL DEFAULT NULL,
  `videos_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`comments_id`, `videos_id`, `users_id`),
  INDEX `fk_comments_videos1_idx` (`videos_id` ASC) VISIBLE,
  INDEX `fk_comments_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_comments_videos1`
    FOREIGN KEY (`videos_id`)
    REFERENCES `mydb`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`comment_has_likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comment_has_likes` (
  `comments_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  `like` TINYINT NULL DEFAULT NULL,
  `dislike` TINYINT NULL DEFAULT NULL,
  `timestamp` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`comments_id`, `users_id`),
  INDEX `fk_comments_has_users_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_comments_has_users_comments1_idx` (`comments_id` ASC) VISIBLE,
  CONSTRAINT `fk_comments_has_users_comments1`
    FOREIGN KEY (`comments_id`)
    REFERENCES `mydb`.`comments` (`comments_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`playlists` (
  `playlists_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `status` ENUM('public', 'private') NULL DEFAULT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`playlists_id`, `users_id`),
  INDEX `fk_playlists_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlists_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`playlists_has_videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`playlists_has_videos` (
  `playlists_id` INT NOT NULL,
  `videos_id` INT NOT NULL,
  PRIMARY KEY (`playlists_id`, `videos_id`),
  INDEX `fk_playlists_has_videos_videos1_idx` (`videos_id` ASC) VISIBLE,
  INDEX `fk_playlists_has_videos_playlists1_idx` (`playlists_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlists_has_videos_playlists1`
    FOREIGN KEY (`playlists_id`)
    REFERENCES `mydb`.`playlists` (`playlists_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlists_has_videos_videos1`
    FOREIGN KEY (`videos_id`)
    REFERENCES `mydb`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`subscriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subscriptions` (
  `channel_channel_id` INT NOT NULL,
  `users_users_id` INT NOT NULL,
  PRIMARY KEY (`channel_channel_id`, `users_users_id`),
  INDEX `fk_channel_has_users_users1_idx` (`users_users_id` ASC) VISIBLE,
  INDEX `fk_channel_has_users_channel1_idx` (`channel_channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_has_users_channel1`
    FOREIGN KEY (`channel_channel_id`)
    REFERENCES `mydb`.`channel` (`channel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_channel_has_users_users1`
    FOREIGN KEY (`users_users_id`)
    REFERENCES `mydb`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tags` (
  `tags_id` INT NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`tags_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`videos_has_likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`videos_has_likes` (
  `videos_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  `like` INT NULL DEFAULT NULL,
  `dislike` INT NULL DEFAULT NULL,
  `timestamp` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`videos_id`, `users_id`),
  INDEX `fk_videos_has_users_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_videos_has_users_videos1_idx` (`videos_id` ASC) VISIBLE,
  CONSTRAINT `fk_videos_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_videos_has_users_videos1`
    FOREIGN KEY (`videos_id`)
    REFERENCES `mydb`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`videos_has_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`videos_has_tags` (
  `videos_videos_id` INT NOT NULL,
  `tags_tags_id` INT NOT NULL,
  PRIMARY KEY (`videos_videos_id`, `tags_tags_id`),
  INDEX `fk_videos_has_tags_tags1_idx` (`tags_tags_id` ASC) VISIBLE,
  INDEX `fk_videos_has_tags_videos_idx` (`videos_videos_id` ASC) VISIBLE,
  CONSTRAINT `fk_videos_has_tags_tags1`
    FOREIGN KEY (`tags_tags_id`)
    REFERENCES `mydb`.`tags` (`tags_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_videos_has_tags_videos`
    FOREIGN KEY (`videos_videos_id`)
    REFERENCES `mydb`.`videos` (`videos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
