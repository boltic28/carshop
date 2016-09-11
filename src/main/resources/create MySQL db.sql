CREATE SCHEMA `db_motor` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `db_motor`.`cars` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `transmition` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `engine` VARCHAR(45) NOT NULL,
  `year` INT(11) NOT NULL,
  `price` INT(11) NOT NULL,
  `odo` INT(11) NOT NULL,
  `view` INT(11) NOT NULL,
  `frame` VARCHAR(45) NOT NULL,
  `agregate` VARCHAR(45) NOT NULL,
  `skin` INT(1) NOT NULL,
  `aircondition` INT(1) NOT NULL,
  `castdisk` INT(1) NOT NULL,
  `img1` VARCHAR(45) NOT NULL,
  `img2` VARCHAR(45) NULL,
  `img3` VARCHAR(45) NULL,
  `added` TIMESTAMP(16) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `db_motor`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `registered` TIMESTAMP(16) NOT NULL,

  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `db_motor`.`user_has_cars` (
  `user_id` INT(11) NOT NULL,
  `car_id` INT(11) NOT NULL,
  INDEX `fk_uhc_users_idx` (`user_id` ASC),
  INDEX `fk_uhc_cars_idx` (`car_id` ASC),
  CONSTRAINT `fk_uhc_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `db_motor`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_uhc_cars`
    FOREIGN KEY (`car_id`)
    REFERENCES `db_motor`.`cars` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;