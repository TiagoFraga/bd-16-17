-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema reserva_bilhetes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema reserva_bilhetes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `reserva_bilhetes` DEFAULT CHARACTER SET utf8 ;
USE `reserva_bilhetes` ;

-- -----------------------------------------------------
-- Table `reserva_bilhetes`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reserva_bilhetes`.`Cliente` (
  `Username` VARCHAR(12) NOT NULL,
  `Password` VARCHAR(15) NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `E-mail` VARCHAR(50) NOT NULL,
  `NIF` INT UNSIGNED NOT NULL,
  `Morada` VARCHAR(50) NULL,
  PRIMARY KEY (`Username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reserva_bilhetes`.`Comboio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reserva_bilhetes`.`Comboio` (
  `id_Comboio` VARCHAR(9) NOT NULL,
  `Lotação` INT UNSIGNED NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_Comboio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reserva_bilhetes`.`Viagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reserva_bilhetes`.`Viagem` (
  `id_Viagem` VARCHAR(9) NOT NULL,
  `id_comboio` VARCHAR(9) NOT NULL,
  `Hora_Partida` DATETIME NOT NULL,
  `Hora_Chegada` DATETIME NOT NULL,
  `Origem` VARCHAR(50) NOT NULL,
  `Destino` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_Viagem`),
  INDEX `Comboio_idx` (`id_comboio` ASC),
  CONSTRAINT `Comboio`
    FOREIGN KEY (`id_comboio`)
    REFERENCES `reserva_bilhetes`.`Comboio` (`id_Comboio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reserva_bilhetes`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reserva_bilhetes`.`Reserva` (
  `id_Reserva` VARCHAR(9) NOT NULL,
  `id_Viagem` VARCHAR(9) NOT NULL,
  `Username` VARCHAR(12) NOT NULL,
  `Data_Reserva` DATETIME NOT NULL,
  `Preço` DECIMAL(5,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Reserva`),
  INDEX `Viagem_idx` (`id_Viagem` ASC),
  INDEX `Cliente_idx` (`Username` ASC),
  CONSTRAINT `Viagem`
    FOREIGN KEY (`id_Viagem`)
    REFERENCES `reserva_bilhetes`.`Viagem` (`id_Viagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Cliente`
    FOREIGN KEY (`Username`)
    REFERENCES `reserva_bilhetes`.`Cliente` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reserva_bilhetes`.`Lugar_Comboio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reserva_bilhetes`.`Lugar_Comboio` (
  `Numero` INT UNSIGNED NOT NULL,
  `Carruagem` INT UNSIGNED NOT NULL,
  `Classe` INT UNSIGNED NOT NULL,
  `id_Comboio` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`Numero`, `Carruagem`, `Classe`, `id_Comboio`),
  INDEX `Reserva_idx` (`id_Comboio` ASC),
  CONSTRAINT `ComboioL`
    FOREIGN KEY (`id_Comboio`)
    REFERENCES `reserva_bilhetes`.`Comboio` (`id_Comboio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reserva_bilhetes`.`Lugar_Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reserva_bilhetes`.`Lugar_Reserva` (
  `Numero` INT UNSIGNED NOT NULL,
  `Carruagem` INT UNSIGNED NOT NULL,
  `Classe` INT UNSIGNED NOT NULL,
  `id_Comboio` VARCHAR(9) NOT NULL,
  `id_Reserva` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`Numero`, `Carruagem`, `Classe`, `id_Comboio`, `id_Reserva`),
  INDEX `ReservaL_idx` (`id_Reserva` ASC),
  INDEX `Lugar_idx` (`Numero` ASC, `Carruagem` ASC, `Classe` ASC, `id_Comboio` ASC),
  CONSTRAINT `Reserva`
    FOREIGN KEY (`id_Reserva`)
    REFERENCES `reserva_bilhetes`.`Reserva` (`id_Reserva`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `Lugar`
    FOREIGN KEY (`Numero` , `Carruagem` , `Classe` , `id_Comboio`)
    REFERENCES `reserva_bilhetes`.`Lugar_Comboio` (`Numero` , `Carruagem` , `Classe` , `id_Comboio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
