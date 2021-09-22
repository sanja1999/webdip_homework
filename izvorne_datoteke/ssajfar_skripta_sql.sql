-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema WebDiP2020x115
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema WebDiP2020x115
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `WebDiP2020x115` DEFAULT CHARACTER SET utf8 ;
USE `WebDiP2020x115` ;

-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`uloga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`uloga` (
  `uloga_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`uloga_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`korisnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`korisnik` (
  `korisnik_id` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `korisnicko_ime` VARCHAR(25) NOT NULL,
  `lozinka` VARCHAR(25) NOT NULL,
  `lozinka_sha1` CHAR(40) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `uvjeti` DATETIME NULL,
  `status` TINYINT NOT NULL,
  `uloga_uloga_id` INT NOT NULL,
  PRIMARY KEY (`korisnik_id`),
  INDEX `fk_korisnik_uloga_idx` (`uloga_uloga_id` ASC),
  CONSTRAINT `fk_korisnik_uloga`
    FOREIGN KEY (`uloga_uloga_id`)
    REFERENCES `WebDiP2020x115`.`uloga` (`uloga_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`tip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`tip` (
  `tip_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`tip_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`dnevnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`dnevnik` (
  `dnevnik_id` INT NOT NULL AUTO_INCREMENT,
  `radnja` TEXT NOT NULL,
  `upit` TEXT NOT NULL,
  `datum_vrijeme` DATETIME NOT NULL,
  `korisnik_korisnik_id` INT NOT NULL,
  `tip_tip_id` INT NOT NULL,
  PRIMARY KEY (`dnevnik_id`),
  INDEX `fk_dnevnik_korisnik1_idx` (`korisnik_korisnik_id` ASC),
  INDEX `fk_dnevnik_tip1_idx` (`tip_tip_id` ASC),
  CONSTRAINT `fk_dnevnik_korisnik1`
    FOREIGN KEY (`korisnik_korisnik_id`)
    REFERENCES `WebDiP2020x115`.`korisnik` (`korisnik_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dnevnik_tip1`
    FOREIGN KEY (`tip_tip_id`)
    REFERENCES `WebDiP2020x115`.`tip` (`tip_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`vlak`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`vlak` (
  `vlak_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `opis` VARCHAR(45) NOT NULL,
  `vrsta_pogona` VARCHAR(45) NOT NULL,
  `maksimalna_brzina` INT NOT NULL,
  `broj_sjedala` INT NOT NULL,
  PRIMARY KEY (`vlak_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`status_izlozbe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`status_izlozbe` (
  `status_izlozbe_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`status_izlozbe_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`tematika_izlozbe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`tematika_izlozbe` (
  `tematika_izlozbe_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `opis` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tematika_izlozbe_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`pobjednik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`pobjednik` (
  `pobjednik_id` INT NOT NULL AUTO_INCREMENT,
  `opis` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pobjednik_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`lokacija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`lokacija` (
  `lokacija_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`lokacija_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`izlozba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`izlozba` (
  `izlozba_id` INT NOT NULL AUTO_INCREMENT,
  `broj_korisnika` INT NOT NULL,
  `pocetak` DATETIME NOT NULL,
  `kraj` DATETIME NOT NULL,
  `status_izlozbe_status_izlozbe_id` INT NOT NULL,
  `tematika_izlozbe_tematika_izlozbe_id` INT NOT NULL,
  `pobjednik_pobjednik_id` INT NULL,
  `lokacija_lokacija_id` INT NOT NULL,
  PRIMARY KEY (`izlozba_id`),
  INDEX `fk_izlozba_status_izlozbe1_idx` (`status_izlozbe_status_izlozbe_id` ASC),
  INDEX `fk_izlozba_tematika_izlozbe1_idx` (`tematika_izlozbe_tematika_izlozbe_id` ASC),
  INDEX `fk_izlozba_pobjednik1_idx` (`pobjednik_pobjednik_id` ASC),
  INDEX `fk_izlozba_lokacija1_idx` (`lokacija_lokacija_id` ASC),
  CONSTRAINT `fk_izlozba_status_izlozbe1`
    FOREIGN KEY (`status_izlozbe_status_izlozbe_id`)
    REFERENCES `WebDiP2020x115`.`status_izlozbe` (`status_izlozbe_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_izlozba_tematika_izlozbe1`
    FOREIGN KEY (`tematika_izlozbe_tematika_izlozbe_id`)
    REFERENCES `WebDiP2020x115`.`tematika_izlozbe` (`tematika_izlozbe_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_izlozba_pobjednik1`
    FOREIGN KEY (`pobjednik_pobjednik_id`)
    REFERENCES `WebDiP2020x115`.`pobjednik` (`pobjednik_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_izlozba_lokacija1`
    FOREIGN KEY (`lokacija_lokacija_id`)
    REFERENCES `WebDiP2020x115`.`lokacija` (`lokacija_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`status` (
  `status_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`prijava`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`prijava` (
  `zahtjev_za_prijavu_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `opis` VARCHAR(45) NOT NULL,
  `korisnik_korisnik_id` INT NOT NULL,
  `izlozba_izlozba_id` INT NOT NULL,
  `status_status_id` INT NOT NULL,
  `vlak_vlak_id` INT NOT NULL,
  PRIMARY KEY (`zahtjev_za_prijavu_id`),
  INDEX `fk_prijava_korisnik1_idx` (`korisnik_korisnik_id` ASC),
  INDEX `fk_prijava_izlozba1_idx` (`izlozba_izlozba_id` ASC),
  INDEX `fk_prijava_status1_idx` (`status_status_id` ASC),
  INDEX `fk_prijava_vlak1_idx` (`vlak_vlak_id` ASC),
  CONSTRAINT `fk_prijava_korisnik1`
    FOREIGN KEY (`korisnik_korisnik_id`)
    REFERENCES `WebDiP2020x115`.`korisnik` (`korisnik_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prijava_izlozba1`
    FOREIGN KEY (`izlozba_izlozba_id`)
    REFERENCES `WebDiP2020x115`.`izlozba` (`izlozba_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prijava_status1`
    FOREIGN KEY (`status_status_id`)
    REFERENCES `WebDiP2020x115`.`status` (`status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prijava_vlak1`
    FOREIGN KEY (`vlak_vlak_id`)
    REFERENCES `WebDiP2020x115`.`vlak` (`vlak_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`materijal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`materijal` (
  `materijal_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `prijava_zahtjev_za_prijavu_id` INT NOT NULL,
  PRIMARY KEY (`materijal_id`),
  INDEX `fk_materijal_prijava1_idx` (`prijava_zahtjev_za_prijavu_id` ASC),
  CONSTRAINT `fk_materijal_prijava1`
    FOREIGN KEY (`prijava_zahtjev_za_prijavu_id`)
    REFERENCES `WebDiP2020x115`.`prijava` (`zahtjev_za_prijavu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`upravljati`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`upravljati` (
  `upravljati_id` INT NOT NULL AUTO_INCREMENT,
  `korisnik_korisnik_id` INT NOT NULL,
  `tematika_izlozbe_tematika_izlozbe_id` INT NOT NULL,
  PRIMARY KEY (`upravljati_id`),
  INDEX `fk_upravljati_korisnik1_idx` (`korisnik_korisnik_id` ASC),
  INDEX `fk_upravljati_tematika_izlozbe1_idx` (`tematika_izlozbe_tematika_izlozbe_id` ASC),
  CONSTRAINT `fk_upravljati_korisnik1`
    FOREIGN KEY (`korisnik_korisnik_id`)
    REFERENCES `WebDiP2020x115`.`korisnik` (`korisnik_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_upravljati_tematika_izlozbe1`
    FOREIGN KEY (`tematika_izlozbe_tematika_izlozbe_id`)
    REFERENCES `WebDiP2020x115`.`tematika_izlozbe` (`tematika_izlozbe_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `WebDiP2020x115`.`je_glasao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WebDiP2020x115`.`je_glasao` (
  `je_glasao_id` INT NOT NULL AUTO_INCREMENT,
  `glasao` TINYINT NOT NULL,
  `korisnik_korisnik_id` INT NOT NULL,
  `izlozba_izlozba_id` INT NOT NULL,
  PRIMARY KEY (`je_glasao_id`),
  INDEX `fk_je_glasao_korisnik1_idx` (`korisnik_korisnik_id` ASC),
  INDEX `fk_je_glasao_izlozba1_idx` (`izlozba_izlozba_id` ASC),
  CONSTRAINT `fk_je_glasao_korisnik1`
    FOREIGN KEY (`korisnik_korisnik_id`)
    REFERENCES `WebDiP2020x115`.`korisnik` (`korisnik_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_je_glasao_izlozba1`
    FOREIGN KEY (`izlozba_izlozba_id`)
    REFERENCES `WebDiP2020x115`.`izlozba` (`izlozba_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
