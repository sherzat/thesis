-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema thesis
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema thesis
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `thesis` DEFAULT CHARACTER SET latin1 ;
USE `thesis` ;

-- -----------------------------------------------------
-- Table `thesis`.`choices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thesis`.`choices` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `thesis`.`migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thesis`.`migrations` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `batch` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `thesis`.`password_resets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thesis`.`password_resets` (
  `email` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `token` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  INDEX `password_resets_email_index` (`email` ASC),
  INDEX `password_resets_token_index` (`token` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `thesis`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thesis`.`questions` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question` VARCHAR(200) NULL DEFAULT NULL,
  `category` INT(11) NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 55
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `thesis`.`question_choices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thesis`.`question_choices` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_id` INT(11) UNSIGNED NOT NULL,
  `choice_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `question_id`, `choice_id`),
  INDEX `fk_question_choices_1_idx` (`question_id` ASC),
  INDEX `fk_question_choices_2_idx` (`choice_id` ASC),
  CONSTRAINT `fk_question_choices_1`
    FOREIGN KEY (`question_id`)
    REFERENCES `thesis`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_choices_2`
    FOREIGN KEY (`choice_id`)
    REFERENCES `thesis`.`choices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 261
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `thesis`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thesis`.`users` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `email` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `password` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `remember_token` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `users_email_unique` (`email` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `thesis`.`responses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thesis`.`responses` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_id` INT(11) UNSIGNED NOT NULL ,
  `user_id` INT(11) UNSIGNED NOT NULL ,
  `choice_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `question_id`, `user_id`, `choice_id`),
  INDEX `fk_responses_1_idx` (`question_id` ASC),
  INDEX `fk_responses_2_idx` (`user_id` ASC),
  INDEX `fk_responses_choices1_idx` (`choice_id` ASC),
  CONSTRAINT `fk_responses_1`
    FOREIGN KEY (`question_id`)
    REFERENCES `thesis`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_responses_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `thesis`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_responses_choices1`
    FOREIGN KEY (`choice_id`)
    REFERENCES `thesis`.`choices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `thesis`.`surveys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thesis`.`surveys` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL ,
  `updated_at` TIMESTAMP NULL ,
  `created_at` TIMESTAMP NULL ,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `thesis`.`survey_questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thesis`.`survey_questions` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `survey_id` INT(11) UNSIGNED NOT NULL,
  `question_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `survey_id`, `question_id`),
  INDEX `fk_survey_questions_1_idx` (`survey_id` ASC),
  INDEX `fk_survey_questions_2_idx` (`question_id` ASC),
  CONSTRAINT `fk_survey_questions_1`
    FOREIGN KEY (`survey_id`)
    REFERENCES `thesis`.`surveys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_survey_questions_2`
    FOREIGN KEY (`question_id`)
    REFERENCES `thesis`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `thesis`.`survey_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `thesis`.`survey_users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `survey_id` INT(11) UNSIGNED NOT NULL ,
  `user_id` INT(11) UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`, `survey_id`, `user_id`),
  INDEX `fk_survey_users_1_idx` (`survey_id` ASC),
  INDEX `fk_survey_users_2_idx` (`user_id` ASC),
  CONSTRAINT `fk_survey_users_1`
    FOREIGN KEY (`survey_id`)
    REFERENCES `thesis`.`surveys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_survey_users_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `thesis`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
