-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema muzickifestivali
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `muzickifestivali` ;

-- -----------------------------------------------------
-- Schema muzickifestivali
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `muzickifestivali` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema projekat_pia
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `projekat_pia` ;

-- -----------------------------------------------------
-- Schema projekat_pia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projekat_pia` DEFAULT CHARACTER SET utf8 ;
USE `muzickifestivali` ;

-- -----------------------------------------------------
-- Table `muzickifestivali`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muzickifestivali`.`user` ;

CREATE TABLE IF NOT EXISTS `muzickifestivali`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` CHAR(64) NOT NULL,
  `phone` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `type` INT NOT NULL,
  `failed_reservations` INT ZEROFILL NULL,
  `Notification` VARCHAR(255) NULL,
  `last_login` TIMESTAMP NULL,
  `warnings` INT ZEROFILL NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `iduser_UNIQUE` (`iduser` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `muzickifestivali`.`festival_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muzickifestivali`.`festival_group` ;

CREATE TABLE IF NOT EXISTS `muzickifestivali`.`festival_group` (
  `idfestival_group` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `avg_rating` INT NULL,
  `number_of_ratings` INT ZEROFILL NULL,
  PRIMARY KEY (`idfestival_group`),
  UNIQUE INDEX `idfestival_group_UNIQUE` (`idfestival_group` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `muzickifestivali`.`festival`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muzickifestivali`.`festival` ;

CREATE TABLE IF NOT EXISTS `muzickifestivali`.`festival` (
  `idfestival` INT NOT NULL AUTO_INCREMENT,
  `year` INT NOT NULL,
  `start` DATETIME NOT NULL,
  `end` DATETIME NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `max_reservations_per_client` INT NOT NULL,
  `bundle_price` INT NOT NULL,
  `description` VARCHAR(255) NULL,
  `visits` INT ZEROFILL NOT NULL,
  `tickets_bought` INT ZEROFILL NOT NULL,
  `facebook` VARCHAR(255) NULL,
  `twitter` VARCHAR(255) NULL,
  `instagram` VARCHAR(255) NULL,
  `youtube` VARCHAR(255) NULL,
  `festival_group_idfestival_group` INT NOT NULL,
  PRIMARY KEY (`idfestival`),
  UNIQUE INDEX `idfestival_UNIQUE` (`idfestival` ASC),
  INDEX `fk_festival_festival_group1_idx` (`festival_group_idfestival_group` ASC),
  CONSTRAINT `fk_festival_festival_group1`
    FOREIGN KEY (`festival_group_idfestival_group`)
    REFERENCES `muzickifestivali`.`festival_group` (`idfestival_group`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `muzickifestivali`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muzickifestivali`.`comment` ;

CREATE TABLE IF NOT EXISTS `muzickifestivali`.`comment` (
  `idcomment` INT NOT NULL AUTO_INCREMENT,
  `user_iduser` INT NOT NULL,
  `festival_group_idfestival_group` INT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `rating` INT NOT NULL,
  PRIMARY KEY (`idcomment`),
  UNIQUE INDEX `idcomment_UNIQUE` (`idcomment` ASC),
  INDEX `fk_comment_user_idx` (`user_iduser` ASC),
  INDEX `fk_comment_festival_group1_idx` (`festival_group_idfestival_group` ASC),
  CONSTRAINT `fk_comment_user`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `muzickifestivali`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_festival_group1`
    FOREIGN KEY (`festival_group_idfestival_group`)
    REFERENCES `muzickifestivali`.`festival_group` (`idfestival_group`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `muzickifestivali`.`media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muzickifestivali`.`media` ;

CREATE TABLE IF NOT EXISTS `muzickifestivali`.`media` (
  `idmedia` INT NOT NULL AUTO_INCREMENT,
  `type` INT NOT NULL,
  `approved` TINYINT ZEROFILL NULL,
  `festival_group_idfestival_group` INT NOT NULL,
  PRIMARY KEY (`idmedia`),
  UNIQUE INDEX `idmedia_UNIQUE` (`idmedia` ASC),
  INDEX `fk_media_festival_group1_idx` (`festival_group_idfestival_group` ASC),
  CONSTRAINT `fk_media_festival_group1`
    FOREIGN KEY (`festival_group_idfestival_group`)
    REFERENCES `muzickifestivali`.`festival_group` (`idfestival_group`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `muzickifestivali`.`performance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muzickifestivali`.`performance` ;

CREATE TABLE IF NOT EXISTS `muzickifestivali`.`performance` (
  `idartist` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  `festival_idfestival` INT NOT NULL,
  PRIMARY KEY (`idartist`),
  UNIQUE INDEX `idartist_UNIQUE` (`idartist` ASC),
  INDEX `fk_artist_festival1_idx` (`festival_idfestival` ASC),
  CONSTRAINT `fk_artist_festival1`
    FOREIGN KEY (`festival_idfestival`)
    REFERENCES `muzickifestivali`.`festival` (`idfestival`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `muzickifestivali`.`day`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muzickifestivali`.`day` ;

CREATE TABLE IF NOT EXISTS `muzickifestivali`.`day` (
  `idTicket` INT NOT NULL AUTO_INCREMENT,
  `day` INT NOT NULL,
  `tickets_remaining` INT NOT NULL,
  `price` INT NOT NULL,
  `festival_idfestival` INT NOT NULL,
  PRIMARY KEY (`idTicket`),
  UNIQUE INDEX `idTicket_UNIQUE` (`idTicket` ASC),
  INDEX `fk_Ticket_festival1_idx` (`festival_idfestival` ASC),
  CONSTRAINT `fk_Ticket_festival1`
    FOREIGN KEY (`festival_idfestival`)
    REFERENCES `muzickifestivali`.`festival` (`idfestival`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `muzickifestivali`.`reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `muzickifestivali`.`reservation` ;

CREATE TABLE IF NOT EXISTS `muzickifestivali`.`reservation` (
  `idreservation` INT NOT NULL AUTO_INCREMENT,
  `reservation_time` TIMESTAMP NULL,
  `number_of_tickets` INT NOT NULL,
  `status` INT NULL,
  `user_iduser` INT NOT NULL,
  `Ticket_idTicket` INT NOT NULL,
  `bundle` TINYINT NULL,
  PRIMARY KEY (`idreservation`),
  UNIQUE INDEX `idreservation_UNIQUE` (`idreservation` ASC),
  INDEX `fk_reservation_user1_idx` (`user_iduser` ASC),
  INDEX `fk_reservation_Ticket1_idx` (`Ticket_idTicket` ASC),
  CONSTRAINT `fk_reservation_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `muzickifestivali`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_Ticket1`
    FOREIGN KEY (`Ticket_idTicket`)
    REFERENCES `muzickifestivali`.`day` (`idTicket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `projekat_pia` ;

-- -----------------------------------------------------
-- Table `projekat_pia`.`festivalgrupa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projekat_pia`.`festivalgrupa` ;

CREATE TABLE IF NOT EXISTS `projekat_pia`.`festivalgrupa` (
  `idgrupe` INT(11) NOT NULL AUTO_INCREMENT,
  `Opis` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`idgrupe`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projekat_pia`.`festival`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projekat_pia`.`festival` ;

CREATE TABLE IF NOT EXISTS `projekat_pia`.`festival` (
  `idFest` INT(11) NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `mesto` VARCHAR(45) NOT NULL,
  `od` DATE NOT NULL,
  `do` DATE NOT NULL,
  `idgrupe` INT(11) NOT NULL,
  `facebook` VARCHAR(128) NOT NULL,
  `twitter` VARCHAR(128) NOT NULL,
  `instagram` VARCHAR(128) NOT NULL,
  `youtube` VARCHAR(128) NOT NULL,
  `opis` VARCHAR(10000) NOT NULL,
  `brKarataPoKorisniku` INT(11) NOT NULL,
  `brKarataPoDanu` INT(11) NOT NULL,
  `brojacpregleda` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idFest`),
  INDEX `idgrupe` (`idgrupe` ASC),
  CONSTRAINT `festival_grupa_fk`
    FOREIGN KEY (`idgrupe`)
    REFERENCES `projekat_pia`.`festivalgrupa` (`idgrupe`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projekat_pia`.`dan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projekat_pia`.`dan` ;

CREATE TABLE IF NOT EXISTS `projekat_pia`.`dan` (
  `idDan` INT(11) NOT NULL,
  `idFest` INT(11) NOT NULL,
  `BrKarata` INT(11) NOT NULL,
  `BrProdatihKarata` INT(11) NOT NULL DEFAULT '0',
  `BrRezervisanihKarata` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idFest`, `idDan`),
  CONSTRAINT `festival_dan`
    FOREIGN KEY (`idFest`)
    REFERENCES `projekat_pia`.`festival` (`idFest`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projekat_pia`.`izvodjac`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projekat_pia`.`izvodjac` ;

CREATE TABLE IF NOT EXISTS `projekat_pia`.`izvodjac` (
  `idIzvodjac` INT(11) NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idIzvodjac`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projekat_pia`.`korisnik`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projekat_pia`.`korisnik` ;

CREATE TABLE IF NOT EXISTS `projekat_pia`.`korisnik` (
  `uname` VARCHAR(45) NOT NULL,
  `lozinka` VARCHAR(64) NOT NULL,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `prestupi` INT(11) NOT NULL,
  `tip` INT(11) NOT NULL,
  `ban` INT(11) NOT NULL,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uname`),
  UNIQUE INDEX `email` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projekat_pia`.`komentar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projekat_pia`.`komentar` ;

CREATE TABLE IF NOT EXISTS `projekat_pia`.`komentar` (
  `idKomentar` INT(11) NOT NULL,
  `idFest` INT(11) NOT NULL,
  `Uname` VARCHAR(45) NOT NULL,
  `Txt` VARCHAR(255) NULL DEFAULT NULL,
  `ocena` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idKomentar`, `idFest`),
  INDEX `Korisnik` (`Uname` ASC),
  INDEX `korisnik_festival_fk` (`idFest` ASC),
  CONSTRAINT `korisnik_festival_fk`
    FOREIGN KEY (`idFest`)
    REFERENCES `projekat_pia`.`festival` (`idFest`),
  CONSTRAINT `korisnik_komentar_fk`
    FOREIGN KEY (`Uname`)
    REFERENCES `projekat_pia`.`korisnik` (`uname`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projekat_pia`.`media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projekat_pia`.`media` ;

CREATE TABLE IF NOT EXISTS `projekat_pia`.`media` (
  `idmedia` INT(11) NOT NULL,
  `idFest` INT(11) NOT NULL,
  `Uname` VARCHAR(45) NOT NULL,
  `Path` VARCHAR(512) NOT NULL,
  `tip` INT(11) NOT NULL,
  `odobrena` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idFest`, `idmedia`),
  INDEX `korisnik` (`Uname` ASC),
  CONSTRAINT `media_festival`
    FOREIGN KEY (`idFest`)
    REFERENCES `projekat_pia`.`festival` (`idFest`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projekat_pia`.`nastupa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projekat_pia`.`nastupa` ;

CREATE TABLE IF NOT EXISTS `projekat_pia`.`nastupa` (
  `idIzvodjac` INT(11) NOT NULL,
  `idFest` INT(11) NOT NULL,
  `idDan` INT(11) NOT NULL,
  `pocinje` TIME NOT NULL,
  `zavrsava` TIME NOT NULL,
  PRIMARY KEY (`idIzvodjac`, `idFest`, `idDan`),
  INDEX `nastupa_izvodjac_fk` (`idIzvodjac` ASC),
  INDEX `idFest` (`idFest` ASC),
  INDEX `idDan` (`idDan` ASC),
  INDEX `nastupa_dan_fk` (`idFest` ASC, `idDan` ASC),
  CONSTRAINT `nastupa_dan_fk`
    FOREIGN KEY (`idFest` , `idDan`)
    REFERENCES `projekat_pia`.`dan` (`idFest` , `idDan`),
  CONSTRAINT `nastupa_izvodjac_fk`
    FOREIGN KEY (`idIzvodjac`)
    REFERENCES `projekat_pia`.`izvodjac` (`idIzvodjac`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projekat_pia`.`poruka`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projekat_pia`.`poruka` ;

CREATE TABLE IF NOT EXISTS `projekat_pia`.`poruka` (
  `idPoruke` INT(11) NOT NULL AUTO_INCREMENT,
  `idKorisnik` VARCHAR(45) NOT NULL,
  `Sadrzaj` VARCHAR(255) NOT NULL,
  `datum` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPoruke`),
  INDEX `idKorisnik` (`idKorisnik` ASC),
  CONSTRAINT `korisnik_poruka_fk`
    FOREIGN KEY (`idKorisnik`)
    REFERENCES `projekat_pia`.`korisnik` (`uname`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projekat_pia`.`rezervacija`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projekat_pia`.`rezervacija` ;

CREATE TABLE IF NOT EXISTS `projekat_pia`.`rezervacija` (
  `idRez` INT(11) NOT NULL AUTO_INCREMENT,
  `Uname` VARCHAR(45) NOT NULL,
  `idFest` INT(11) NOT NULL,
  `idDan` INT(11) NOT NULL,
  `tip` INT(11) NOT NULL,
  `status` INT(11) NOT NULL,
  `datum` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `brojkarata` INT(11) NOT NULL,
  PRIMARY KEY (`idRez`),
  INDEX `Uname` (`Uname` ASC),
  INDEX `festival_dan` (`idFest` ASC, `idDan` ASC),
  CONSTRAINT `festival_rez_fk`
    FOREIGN KEY (`idFest` , `idDan`)
    REFERENCES `projekat_pia`.`dan` (`idFest` , `idDan`),
  CONSTRAINT `korisnik_rez_fk`
    FOREIGN KEY (`Uname`)
    REFERENCES `projekat_pia`.`korisnik` (`uname`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
