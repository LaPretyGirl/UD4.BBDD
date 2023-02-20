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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Móbil` VARCHAR(45) NOT NULL,
  `VIP / No VIP` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipus polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipus polissa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripció` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venedor` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Mòbil` VARCHAR(45) NOT NULL,
  `Descripció` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Polissa` (
  `NumPolissa` INT NOT NULL,
  `Import` VARCHAR(45) NOT NULL,
  `DataInici` VARCHAR(45) NOT NULL,
  `DataFinal` VARCHAR(45) NOT NULL,
  `TipuDePagament` VARCHAR(45) NOT NULL,
  `Client_DNI` INT NOT NULL,
  `Venedor_DNI` INT NOT NULL,
  `Venedor_ID` INT NOT NULL,
  PRIMARY KEY (`NumPolissa`),
  UNIQUE INDEX `NumPolissa_UNIQUE` (`NumPolissa` ASC) VISIBLE,
  INDEX `fk_Polissa_Client_idx` (`Client_DNI` ASC) VISIBLE,
  INDEX `fk_Polissa_Venedor1_idx` (`Venedor_DNI` ASC) VISIBLE,
  INDEX `fk_Polissa_Venedor2_idx` (`Venedor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Client`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `mydb`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Venedor1`
    FOREIGN KEY (`Venedor_DNI`)
    REFERENCES `mydb`.`Venedor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Venedor2`
    FOREIGN KEY (`Venedor_ID`)
    REFERENCES `mydb`.`Tipus polissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
