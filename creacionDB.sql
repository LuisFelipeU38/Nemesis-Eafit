CREATE DATABASE nemesis;

use nemesis;
CREATE TABLE `nemesis`.`estudiante` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(50) NULL DEFAULT NULL,
	`apellido` VARCHAR(80) NULL,
	`email` VARCHAR(50) NULL,
	`password` VARCHAR(32) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `uq_email` (`email` ASC) );
    
/* CREATE TABLE `nemesis`.`empleado` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(50) NULL DEFAULT NULL,
	`apellido` VARCHAR(80) NULL,
	`email` VARCHAR(50) NULL,
	`password` VARCHAR(32) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `uq_email` (`email` ASC) );
    
CREATE TABLE `nemesis`.`invitado` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(50) NULL DEFAULT NULL,
	`apellido` VARCHAR(80) NULL,
    `documento identidad` BIGINT NOT NULL,
	`email` VARCHAR(50) NULL,
	`password` VARCHAR(32) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `uq_email` (`email` ASC) ); */
    
CREATE TABLE `nemesis`.`zonas` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre`  VARCHAR(50) NULL DEFAULT NULL,
  `estudianteId` BIGINT NOT NULL,
  `empleadoId` BIGINT NOT NULL,
  `invitadoId` BIGINT NOT NULL,
  `estado` FLOAT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pc_estudiante`
    FOREIGN KEY (`estudianteId`)
    REFERENCES `nemesis`.`estudiante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_pc_empleado`
    FOREIGN KEY (`empleadoId`)
    REFERENCES `nemesis`.`empleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_pc_invitado`
    FOREIGN KEY (`invitadoId`)
    REFERENCES `nemesis`.`invitado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
  
CREATE TABLE `nemesis`.`ingenieria` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
    `celda` BIGINT NOT NUll,
  `zonasId` BIGINT NOT NULL,
  `disponible` FLOAT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pc_zonas`
    FOREIGN KEY (`zonasId`)
    REFERENCES `nemesis`.`zonas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `nemesis`.`empleados` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
    `celda` BIGINT NOT NUll,
  `zonasId` BIGINT NOT NULL,
  `disponible` FLOAT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pc_zonass`
    FOREIGN KEY (`zonasId`)
    REFERENCES `nemesis`.`zonas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `nemesis`.`norte` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
    `celda` BIGINT NOT NUll,
  `zonasId` BIGINT NOT NULL,
  `disponible` FLOAT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pc_zonasss`
    FOREIGN KEY (`zonasId`)
    REFERENCES `nemesis`.`zonas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `nemesis`.`idiomas` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
    `celda` BIGINT NOT NUll,
  `zonasId` BIGINT NOT NULL,
  `disponible` FLOAT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pc_zonassss`
    FOREIGN KEY (`zonasId`)
    REFERENCES `nemesis`.`zonas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);