-- MySQL Script generated by MySQL Workbench
-- 09/30/18 13:52:32
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema dbsistemalaravel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbsistemalaravel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbsistemalaravel` DEFAULT CHARACTER SET utf8 ;
USE `dbsistemalaravel` ;

-- -----------------------------------------------------
-- Table `dbsistemalaravel`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsistemalaravel`.`CATEGORIA` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `nombrecate` VARCHAR(50) NOT NULL,
  `descripcioncate` VARCHAR(256) NULL,
  `condicion` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsistemalaravel`.`ARTICULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsistemalaravel`.`ARTICULO` (
  `idarticulo` INT NOT NULL AUTO_INCREMENT,
  `idcategoria` INT NOT NULL,
  `codigo` VARCHAR(45) NULL,
  `nombrearti` VARCHAR(100) NOT NULL,
  `stock` INT NOT NULL,
  `descripcionarti` VARCHAR(512) NULL,
  `imagen` VARCHAR(50) NULL,
  `estadoarti` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idarticulo`),
  INDEX `fk_articulo_categoria_idx` (`idcategoria` ASC),
  CONSTRAINT `fk_articulo_categoria`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `dbsistemalaravel`.`CATEGORIA` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsistemalaravel`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsistemalaravel`.`PERSONA` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `tipopersona` VARCHAR(45) NOT NULL,
  `nombreper` VARCHAR(100) NOT NULL,
  `tipo_documento` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(15) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idpersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsistemalaravel`.`INGRESO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsistemalaravel`.`INGRESO` (
  `idingreso` INT NOT NULL AUTO_INCREMENT,
  `idproveedor` INT NOT NULL,
  `tipocomprovante` VARCHAR(45) NOT NULL,
  `seriecomprovante` VARCHAR(10) NULL,
  `numerocomprovante` VARCHAR(10) NOT NULL,
  `fechahoraingre` DATETIME NOT NULL,
  `estadoingreso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idingreso`),
  INDEX `fk_ingreso_persona_idx` (`idproveedor` ASC),
  CONSTRAINT `fk_ingreso_persona`
    FOREIGN KEY (`idproveedor`)
    REFERENCES `dbsistemalaravel`.`PERSONA` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsistemalaravel`.`DETALLE_INGRESO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsistemalaravel`.`DETALLE_INGRESO` (
  `iddetalle_ingreso` INT NOT NULL AUTO_INCREMENT,
  `idingreso` INT NOT NULL,
  `idarticulo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `preciocompra` DECIMAL(11,2) NOT NULL,
  `precioventa` DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_ingreso`),
  INDEX `fk_detalle_ingreso_idx` (`idingreso` ASC),
  INDEX `fk_detalle_ingreso_articulo_idx` (`idarticulo` ASC),
  CONSTRAINT `fk_detalle_ingreso`
    FOREIGN KEY (`idingreso`)
    REFERENCES `dbsistemalaravel`.`INGRESO` (`idingreso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_ingreso_articulo`
    FOREIGN KEY (`idarticulo`)
    REFERENCES `dbsistemalaravel`.`ARTICULO` (`idarticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsistemalaravel`.`PEDIDO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsistemalaravel`.`PEDIDO` (
  `idpedido` INT NOT NULL AUTO_INCREMENT,
  `idcliente` INT NOT NULL,
  `codigopedido` VARCHAR(45) NOT NULL,
  `fechahoraped` VARCHAR(45) NOT NULL,
  `totalpedido` DECIMAL(11,2) NOT NULL,
  `estadoped` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpedido`),
  INDEX `fk_pedido_cliente_idx` (`idcliente` ASC),
  CONSTRAINT `fk_pedido_cliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `dbsistemalaravel`.`PERSONA` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsistemalaravel`.`DETALLE_PEDIDO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsistemalaravel`.`DETALLE_PEDIDO` (
  `iddetalle_pedido` INT NOT NULL AUTO_INCREMENT,
  `idpedido` INT NOT NULL,
  `idarticulo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `preciopedido` DECIMAL(11,2) NOT NULL,
  `credito` DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_pedido`),
  INDEX `fk_detalle_pedido_articulo_idx` (`idarticulo` ASC),
  INDEX `fk_detalle_pedido_idx` (`idpedido` ASC),
  CONSTRAINT `fk_detalle_pedido_articulo`
    FOREIGN KEY (`idarticulo`)
    REFERENCES `dbsistemalaravel`.`ARTICULO` (`idarticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_pedido`
    FOREIGN KEY (`idpedido`)
    REFERENCES `dbsistemalaravel`.`PEDIDO` (`idpedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;