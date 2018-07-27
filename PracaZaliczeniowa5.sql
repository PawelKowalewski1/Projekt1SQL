-- MySQL Script generated by MySQL Workbench
-- Fri Jul 27 14:20:40 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PracaZaliczeniowa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PracaZaliczeniowa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PracaZaliczeniowa` DEFAULT CHARACTER SET utf8 ;
USE `PracaZaliczeniowa` ;

-- -----------------------------------------------------
-- Table `PracaZaliczeniowa`.`klienci`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PracaZaliczeniowa`.`klienci` (
  `idklienci` INT NOT NULL AUTO_INCREMENT,
  `imię` VARCHAR(45) NOT NULL,
  `nazwisko` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `e-mail` VARCHAR(45) NULL,
  `nazwa firmy` VARCHAR(45) NULL,
  `nip` VARCHAR(45) NULL,
  PRIMARY KEY (`idklienci`),
  UNIQUE INDEX `idklienci_UNIQUE` (`idklienci` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PracaZaliczeniowa`.`silniki`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PracaZaliczeniowa`.`silniki` (
  `idsilniki` INT NOT NULL AUTO_INCREMENT,
  `producent` VARCHAR(45) NOT NULL,
  `pojemność` VARCHAR(45) NOT NULL,
  `moc` VARCHAR(45) NOT NULL,
  `zasilanie` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsilniki`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PracaZaliczeniowa`.`łodzie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PracaZaliczeniowa`.`łodzie` (
  `idłodzie` INT NOT NULL AUTO_INCREMENT,
  `marka` VARCHAR(45) NOT NULL,
  `typ` VARCHAR(45) NOT NULL,
  `nr_kadluba` VARCHAR(45) NOT NULL,
  `przyczepa` VARCHAR(45) NOT NULL,
  `antyfouling` VARCHAR(45) NOT NULL,
  `przekładnia` VARCHAR(45) NOT NULL,
  `silniki_idsilniki` INT NOT NULL,
  `klienci_idklienci` INT NOT NULL,
  PRIMARY KEY (`idłodzie`),
  CONSTRAINT `fk_łodzie_silniki1`
    FOREIGN KEY (`silniki_idsilniki`)
    REFERENCES `PracaZaliczeniowa`.`silniki` (`idsilniki`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_łodzie_klienci1`
    FOREIGN KEY (`klienci_idklienci`)
    REFERENCES `PracaZaliczeniowa`.`klienci` (`idklienci`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PracaZaliczeniowa`.`przeglądy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PracaZaliczeniowa`.`przeglądy` (
  `idprzeglądy` INT NOT NULL AUTO_INCREMENT,
  `data` VARCHAR(45) NOT NULL,
  `łodzie_idłodzie` INT NOT NULL,
  PRIMARY KEY (`idprzeglądy`),
  CONSTRAINT `fk_przeglądy_łodzie`
    FOREIGN KEY (`łodzie_idłodzie`)
    REFERENCES `PracaZaliczeniowa`.`łodzie` (`idłodzie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PracaZaliczeniowa`.`CzynnoscSERWISOWE`
-- -----------------------------------------------------
drop table czynnoscserwisowe;
CREATE TABLE IF NOT EXISTS `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (
  `idCzynności serwisowe` INT NOT NULL AUTO_INCREMENT,
  `nazwa czynności` VARCHAR(120) NULL,
  `czasochłonność` VARCHAR(45) NULL,
  `koszt netto` VARCHAR(45) NULL,
  PRIMARY KEY (`idCzynności serwisowe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PracaZaliczeniowa`.`przegladyczynnosci`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PracaZaliczeniowa`.`przegladyczynnosci` (
  `idprzegladyczynnosci` INT NOT NULL,
  `przegladyczynnoscicol` VARCHAR(45) NULL,
  `przeglądy_idprzeglądy` INT NOT NULL,
  `CzynnoscSERWISOWE_idCzynności serwisowe` INT NOT NULL,
  PRIMARY KEY (`idprzegladyczynnosci`),
  CONSTRAINT `fk_przegladyczynnosci_przeglądy1`
    FOREIGN KEY (`przeglądy_idprzeglądy`)
    REFERENCES `PracaZaliczeniowa`.`przeglądy` (`idprzeglądy`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_przegladyczynnosci_CzynnoscSERWISOWE1`
    FOREIGN KEY (`CzynnoscSERWISOWE_idCzynności serwisowe`)
    REFERENCES `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

select * from klienci;

INSERT INTO `PracaZaliczeniowa`.`klienci` (`idklienci`, `imię`, `nazwisko`, `telefon`, `e-mail`, `nazwa firmy`, `nip`) VALUES (1, 'Adam', 'Adamski', '1234567', 'aaa@aaa.pl', NULL, NULL);
INSERT INTO `PracaZaliczeniowa`.`klienci` (`idklienci`, `imię`, `nazwisko`, `telefon`, `e-mail`, `nazwa firmy`, `nip`) VALUES (2, 'Bartek', 'Bartkowski', '2345678', 'bbb@bbb.pl', NULL, NULL);
INSERT INTO `PracaZaliczeniowa`.`klienci` (`idklienci`, `imię`, `nazwisko`, `telefon`, `e-mail`, `nazwa firmy`, `nip`) VALUES (3, 'Cyprian', 'Cypriański', '3456789', 'ccc@ccc.pl', 'Cyprex Sp. zo.o.', '123456789');
INSERT INTO `PracaZaliczeniowa`.`klienci` (`idklienci`, `imię`, `nazwisko`, `telefon`, `e-mail`, `nazwa firmy`, `nip`) VALUES (4, 'Darek', 'Darkiewicz', '4567890', 'ddd@ddd.pl', 'DarPol Sp.j.', '234567123');
INSERT INTO `PracaZaliczeniowa`.`klienci` (`idklienci`, `imię`, `nazwisko`, `telefon`, `e-mail`, `nazwa firmy`, `nip`) VALUES (5, 'Edward', 'Edkowski', '1212356', 'eee@eee.pl', NULL, NULL);

INSERT INTO `PracaZaliczeniowa`.`silniki` (`idsilniki`, `producent`, `pojemność`, `moc`, `zasilanie`) VALUES (1, 'Mercruiser', '3.0', '130', 'gażnik');
INSERT INTO `PracaZaliczeniowa`.`silniki` (`idsilniki`, `producent`, `pojemność`, `moc`, `zasilanie`) VALUES (2, 'Mercruiser', '5.7', '300', 'MPI');
INSERT INTO `PracaZaliczeniowa`.`silniki` (`idsilniki`, `producent`, `pojemność`, `moc`, `zasilanie`) VALUES (3, 'Mercruiser', '5.0', '260', 'EFI');
INSERT INTO `PracaZaliczeniowa`.`silniki` (`idsilniki`, `producent`, `pojemność`, `moc`, `zasilanie`) VALUES (4, 'Mercruiser', '4.3', '220', 'MPI');
INSERT INTO `PracaZaliczeniowa`.`silniki` (`idsilniki`, `producent`, `pojemność`, `moc`, `zasilanie`) VALUES (5, 'Volvo Paneta', '5.0', '260', 'MPI');
INSERT INTO `PracaZaliczeniowa`.`silniki` (`idsilniki`, `producent`, `pojemność`, `moc`, `zasilanie`) VALUES (6, 'Optimax', '3.0', '240', 'MPI');
INSERT INTO `PracaZaliczeniowa`.`silniki` (`idsilniki`, `producent`, `pojemność`, `moc`, `zasilanie`) VALUES (7, 'Caterpillar', '9.2', '960', 'CRDI');
INSERT INTO `PracaZaliczeniowa`.`silniki` (`idsilniki`, `producent`, `pojemność`, `moc`, `zasilanie`) VALUES (8, 'Cummins', '5.8', '480', 'CRDI');

INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (1, 'przegląd olejowy', '10', '1200');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (2, 'osiowanie silnika', '4', '480');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (3, 'antufouling odświeżenie', '20', '2400');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (4, 'antyfouling nowy', '30', '3600');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (5, 'wymiana sterociągu', '5', '600');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (6, 'wymontowanie i zamontowanie silnika', '14', '1500');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (7, 'wymont zamont gimbala', '5', '600');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (8, 'wymonotanie i zamontowanie przekładni napędowej', '2', '240');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (9, 'uszczelnienie przekładni góra', '5', '600');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (10, 'uszczelnienie przekładni dół', '6', '720');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (11, 'wymiana gum osłonowych gimbala', '5', '600');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (12, 'wymiana łożyska gimbala', '3', '360');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (13, 'wymiana czujników trymu', '4', '480');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (14, 'montaż nawigacji', '6', '720');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (15, 'naprawa główna pawęży', '50', '6000');
INSERT INTO `PracaZaliczeniowa`.`CzynnoscSERWISOWE` (`idCzynności serwisowe`, `nazwa czynności`, `czasochłonność`, `koszt netto`) VALUES (16, 'zaprawka żelkotowa', '4', '480');

INSERT INTO `PracaZaliczeniowa`.`łodzie` (`idłodzie`, `marka`, `typ`, `nr_kadluba`, `przyczepa`, `antyfouling`, `przekładnia`, `silniki_idsilniki`, `klienci_idklienci`) VALUES (1, 'Bayliner', '245', 'US-XXX333444555', 'tak', 'tak', 'Alpha1', 3, 1);
INSERT INTO `PracaZaliczeniowa`.`łodzie` (`idłodzie`, `marka`, `typ`, `nr_kadluba`, `przyczepa`, `antyfouling`, `przekładnia`, `silniki_idsilniki`, `klienci_idklienci`) VALUES (2, 'Searay', '280', 'US-XYZ444555666', 'tak', 'nie', 'Bravo3', 4, 3);
INSERT INTO `PracaZaliczeniowa`.`łodzie` (`idłodzie`, `marka`, `typ`, `nr_kadluba`, `przyczepa`, `antyfouling`, `przekładnia`, `silniki_idsilniki`, `klienci_idklienci`) VALUES (3, 'Chaparral', '270SSi', 'NO-SSS111222333', 'nie', 'nie', 'ZF63A', 5, 1);
INSERT INTO `PracaZaliczeniowa`.`łodzie` (`idłodzie`, `marka`, `typ`, `nr_kadluba`, `przyczepa`, `antyfouling`, `przekładnia`, `silniki_idsilniki`, `klienci_idklienci`) VALUES (4, 'Stingray', '2450', 'CA-ZZZ111222333', 'tak', 'nie', 'Bravo3', 6, 4);
INSERT INTO `PracaZaliczeniowa`.`łodzie` (`idłodzie`, `marka`, `typ`, `nr_kadluba`, `przyczepa`, `antyfouling`, `przekładnia`, `silniki_idsilniki`, `klienci_idklienci`) VALUES (5, 'SeaDoo', '240Speedster', 'US-RRREEEE333444', 'tak', 'nie', 'JetPower', 7, 5);
INSERT INTO `PracaZaliczeniowa`.`łodzie` (`idłodzie`, `marka`, `typ`, `nr_kadluba`, `przyczepa`, `antyfouling`, `przekładnia`, `silniki_idsilniki`, `klienci_idklienci`) VALUES (6, 'Azimut', 'A40S', 'IT-AZI40S4445555', 'tak', 'tak', 'SX', 8, 2);
INSERT INTO `PracaZaliczeniowa`.`łodzie` (`idłodzie`, `marka`, `typ`, `nr_kadluba`, `przyczepa`, `antyfouling`, `przekładnia`, `silniki_idsilniki`, `klienci_idklienci`) VALUES (7, 'Rinker', 'Captiva246', 'US-RIN456789012', 'nie', 'tak', 'ZF63A', 1, 2);
INSERT INTO `PracaZaliczeniowa`.`łodzie` (`idłodzie`, `marka`, `typ`, `nr_kadluba`, `przyczepa`, `antyfouling`, `przekładnia`, `silniki_idsilniki`, `klienci_idklienci`) VALUES (8, 'Cobalt', 'A25', 'US-COB123456789', 'nie', 'tak', 'Bravo3', 2, 3);


INSERT INTO `PracaZaliczeniowa`.`przeglądy` (`idprzeglądy`, `data`, `łodzie_idłodzie`) VALUES (1, '12.06.2017', 1);
INSERT INTO `PracaZaliczeniowa`.`przeglądy` (`idprzeglądy`, `data`, `łodzie_idłodzie`) VALUES (2, '12.07.2017', 3);
INSERT INTO `PracaZaliczeniowa`.`przeglądy` (`idprzeglądy`, `data`, `łodzie_idłodzie`) VALUES (3, '3.08.2017', 2);
INSERT INTO `PracaZaliczeniowa`.`przeglądy` (`idprzeglądy`, `data`, `łodzie_idłodzie`) VALUES (4, '4.09.2017', 4);
INSERT INTO `PracaZaliczeniowa`.`przeglądy` (`idprzeglądy`, `data`, `łodzie_idłodzie`) VALUES (5, '22.07.2018', 7);
INSERT INTO `PracaZaliczeniowa`.`przeglądy` (`idprzeglądy`, `data`, `łodzie_idłodzie`) VALUES (6, '24.07.2018', 5);


INSERT INTO `PracaZaliczeniowa`.`przegladyczynnosci` (`idprzegladyczynnosci`, `przegladyczynnoscicol`, `przeglądy_idprzeglądy`, `CzynnoscSERWISOWE_idCzynności serwisowe`) VALUES (1, NULL, 1, 12);
INSERT INTO `PracaZaliczeniowa`.`przegladyczynnosci` (`idprzegladyczynnosci`, `przegladyczynnoscicol`, `przeglądy_idprzeglądy`, `CzynnoscSERWISOWE_idCzynności serwisowe`) VALUES (2, NULL, 1, 6);
INSERT INTO `PracaZaliczeniowa`.`przegladyczynnosci` (`idprzegladyczynnosci`, `przegladyczynnoscicol`, `przeglądy_idprzeglądy`, `CzynnoscSERWISOWE_idCzynności serwisowe`) VALUES (3, NULL, 1, 4);
INSERT INTO `PracaZaliczeniowa`.`przegladyczynnosci` (`idprzegladyczynnosci`, `przegladyczynnoscicol`, `przeglądy_idprzeglądy`, `CzynnoscSERWISOWE_idCzynności serwisowe`) VALUES (4, NULL, 1, 3);
INSERT INTO `PracaZaliczeniowa`.`przegladyczynnosci` (`idprzegladyczynnosci`, `przegladyczynnoscicol`, `przeglądy_idprzeglądy`, `CzynnoscSERWISOWE_idCzynności serwisowe`) VALUES (5, NULL, 2, 5);
INSERT INTO `PracaZaliczeniowa`.`przegladyczynnosci` (`idprzegladyczynnosci`, `przegladyczynnoscicol`, `przeglądy_idprzeglądy`, `CzynnoscSERWISOWE_idCzynności serwisowe`) VALUES (6, NULL, 2, 7);
INSERT INTO `PracaZaliczeniowa`.`przegladyczynnosci` (`idprzegladyczynnosci`, `przegladyczynnoscicol`, `przeglądy_idprzeglądy`, `CzynnoscSERWISOWE_idCzynności serwisowe`) VALUES (7, NULL, 2, 9);
INSERT INTO `PracaZaliczeniowa`.`przegladyczynnosci` (`idprzegladyczynnosci`, `przegladyczynnoscicol`, `przeglądy_idprzeglądy`, `CzynnoscSERWISOWE_idCzynności serwisowe`) VALUES (8, NULL, 3, 11);
INSERT INTO `PracaZaliczeniowa`.`przegladyczynnosci` (`idprzegladyczynnosci`, `przegladyczynnoscicol`, `przeglądy_idprzeglądy`, `CzynnoscSERWISOWE_idCzynności serwisowe`) VALUES (9, NULL, 4, 2);
INSERT INTO `PracaZaliczeniowa`.`przegladyczynnosci` (`idprzegladyczynnosci`, `przegladyczynnoscicol`, `przeglądy_idprzeglądy`, `CzynnoscSERWISOWE_idCzynności serwisowe`) VALUES (10, NULL, 4, 4);
INSERT INTO `PracaZaliczeniowa`.`przegladyczynnosci` (`idprzegladyczynnosci`, `przegladyczynnoscicol`, `przeglądy_idprzeglądy`, `CzynnoscSERWISOWE_idCzynności serwisowe`) VALUES (11, NULL, 5, 6);
INSERT INTO `PracaZaliczeniowa`.`przegladyczynnosci` (`idprzegladyczynnosci`, `przegladyczynnoscicol`, `przeglądy_idprzeglądy`, `CzynnoscSERWISOWE_idCzynności serwisowe`) VALUES (12, NULL, 6, 8);


select * from przeglądy;

select * from klienci;

select * from przeglądy;

select * from silniki;

select * from łodzie;

select * from przegladyczynnosci;

select* from czynnoscserwisowe;

