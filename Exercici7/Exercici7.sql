-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici7` ;
USE `Exercici7` ;

-- -----------------------------------------------------
-- Table `Exercici7`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Empleat` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NULL,
  `Data_naixement` VARCHAR(45) NULL,
  `Telèfon` VARCHAR(45) NOT NULL,
  `Edat` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Ticket` (
  `ID` INT NOT NULL,
  `Nº_factura` VARCHAR(45) NOT NULL,
  `Empleat` VARCHAR(45) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `Preu_IVA` VARCHAR(45) NOT NULL,
  `Ticketcol` VARCHAR(45) NULL,
  `Empleat_DNI` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Ticket_Empleat_idx` (`Empleat_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Empleat`
    FOREIGN KEY (`Empleat_DNI`)
    REFERENCES `Exercici7`.`Empleat` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Producte` (
  `Codi` INT NOT NULL,
  `Codi_barres` VARCHAR(45) NOT NULL,
  `Preu_unitari` VARCHAR(45) NULL,
  `Descripció` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NOT NULL,
  `Preu_total` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Codi`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Linea_de_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Linea_de_ticket` (
  `ID` INT NOT NULL,
  `Descripció` VARCHAR(45) NULL,
  `Unitats_descompte` VARCHAR(45) NOT NULL,
  `Preu_unitari` VARCHAR(45) NULL,
  `Preu_total` VARCHAR(45) NOT NULL,
  `Ticket_ID` INT NOT NULL,
  `Producte_Codi` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Linea_de_ticket_Ticket1_idx` (`Ticket_ID` ASC) VISIBLE,
  INDEX `fk_Linea_de_ticket_Producte1_idx` (`Producte_Codi` ASC) VISIBLE,
  CONSTRAINT `fk_Linea_de_ticket_Ticket1`
    FOREIGN KEY (`Ticket_ID`)
    REFERENCES `Exercici7`.`Ticket` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linea_de_ticket_Producte1`
    FOREIGN KEY (`Producte_Codi`)
    REFERENCES `Exercici7`.`Producte` (`Codi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
