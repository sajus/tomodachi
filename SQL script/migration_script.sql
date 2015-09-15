-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: domo1
-- Source Schemata: domo
-- Created: Tue Sep 15 17:36:08 2015
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;;

-- ----------------------------------------------------------------------------
-- Schema domo1
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `domo1` ;
CREATE SCHEMA IF NOT EXISTS `domo1` ;

-- ----------------------------------------------------------------------------
-- Table domo1.level
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `domo1`.`level` (
  `level_id` INT(11) NOT NULL AUTO_INCREMENT,
  `level_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`level_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table domo1.module
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `domo1`.`module` (
  `module_id` INT(11) NOT NULL AUTO_INCREMENT,
  `module_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`module_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table domo1.question
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `domo1`.`question` (
  `question_id` INT(11) NOT NULL AUTO_INCREMENT,
  `answer` INT(11) NULL DEFAULT NULL,
  `op1` VARCHAR(255) NULL DEFAULT NULL,
  `op2` VARCHAR(255) NULL DEFAULT NULL,
  `op3` VARCHAR(255) NULL DEFAULT NULL,
  `op4` VARCHAR(255) NULL DEFAULT NULL,
  `question` VARCHAR(255) NULL DEFAULT NULL,
  `level_level_id` INT(11) NULL DEFAULT NULL,
  `module_module_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  INDEX `FKBA823BE64E4813F` (`level_level_id` ASC),
  INDEX `FKBA823BE6BFD25BD` (`module_module_id` ASC),
  CONSTRAINT `FKBA823BE64E4813F`
    FOREIGN KEY (`level_level_id`)
    REFERENCES `domo1`.`level` (`level_id`),
  CONSTRAINT `FKBA823BE6BFD25BD`
    FOREIGN KEY (`module_module_id`)
    REFERENCES `domo1`.`module` (`module_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table domo1.set_exam
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `domo1`.`set_exam` (
  `set_exam_id` INT(11) NOT NULL AUTO_INCREMENT,
  `actual_start_time` VARCHAR(255) NULL DEFAULT NULL,
  `duration` VARCHAR(255) NULL DEFAULT NULL,
  `is_conducted` TINYINT(1) NOT NULL,
  `marks` INT(11) NULL DEFAULT NULL,
  `start_date` VARCHAR(255) NOT NULL,
  `start_time` VARCHAR(255) NOT NULL,
  `templatesetexam_template_id` INT(11) NOT NULL,
  `user_userid` INT(11) NOT NULL,
  PRIMARY KEY (`set_exam_id`),
  INDEX `FK545921DCA2BBA118` (`templatesetexam_template_id` ASC),
  INDEX `FK545921DC1972A3FB` (`user_userid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 56
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table domo1.template
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `domo1`.`template` (
  `template_id` INT(11) NOT NULL AUTO_INCREMENT,
  `question_count` INT(11) NULL DEFAULT NULL,
  `template_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`template_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table domo1.template_module_level
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `domo1`.`template_module_level` (
  `template_module_level_id` INT(11) NOT NULL AUTO_INCREMENT,
  `count` INT(11) NULL DEFAULT NULL,
  `level_id` INT(11) NULL DEFAULT NULL,
  `template_id` INT(11) NULL DEFAULT NULL,
  `module_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`template_module_level_id`),
  INDEX `FKDFD85796432436E4` (`level_id` ASC),
  INDEX `FKDFD85796C63307D7` (`template_id` ASC),
  INDEX `FKDFD857966F0B2B90` (`template_id` ASC),
  INDEX `FKDFD857963590A5` (`module_id` ASC),
  CONSTRAINT `FKDFD857963590A5`
    FOREIGN KEY (`module_id`)
    REFERENCES `domo1`.`template_modules` (`template_module_id`),
  CONSTRAINT `FKDFD85796432436E4`
    FOREIGN KEY (`level_id`)
    REFERENCES `domo1`.`level` (`level_id`),
  CONSTRAINT `FKDFD857966F0B2B90`
    FOREIGN KEY (`template_id`)
    REFERENCES `domo1`.`template` (`template_id`),
  CONSTRAINT `FKDFD85796C63307D7`
    FOREIGN KEY (`template_id`)
    REFERENCES `domo1`.`template_modules` (`template_module_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table domo1.template_modules
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `domo1`.`template_modules` (
  `template_module_id` INT(11) NOT NULL AUTO_INCREMENT,
  `module_id` INT(11) NULL DEFAULT NULL,
  `template_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`template_module_id`),
  INDEX `FKDE0480C229CC9BD0` (`module_id` ASC),
  INDEX `FKDE0480C26F0B2B90` (`template_id` ASC),
  CONSTRAINT `FKDE0480C229CC9BD0`
    FOREIGN KEY (`module_id`)
    REFERENCES `domo1`.`module` (`module_id`),
  CONSTRAINT `FKDE0480C26F0B2B90`
    FOREIGN KEY (`template_id`)
    REFERENCES `domo1`.`template` (`template_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table domo1.template_question
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `domo1`.`template_question` (
  `template_question_id` INT(11) NOT NULL AUTO_INCREMENT,
  `templatequestionsetexam_set_exam_id` INT(11) NULL DEFAULT NULL,
  `question_number` INT(11) NOT NULL,
  `user_answer` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`template_question_id`),
  INDEX `FKC1120A0BB473490B` (`templatequestionsetexam_set_exam_id` ASC),
  CONSTRAINT `FKC1120A0BB473490B`
    FOREIGN KEY (`templatequestionsetexam_set_exam_id`)
    REFERENCES `domo1`.`set_exam` (`set_exam_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 49
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Table domo1.user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `domo1`.`user` (
  `userid` INT(11) NOT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `role` VARCHAR(255) NULL DEFAULT NULL,
  `username` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- ----------------------------------------------------------------------------
-- Routine domo1.random_question
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `domo1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `random_question`(IN selected_template int)
BEGIN
	#declare variable
	declare v_template_id, v_module_id, v_level_id, v_count, result, result_list int;
	declare done int default false;

	#declare cursor
	declare cur1 cursor for select template_id,module_id, level_id, count
	from template_module_level
	where template_id = selected_template;

	#declare handle
	declare continue handler for not found set done = true;
	
	#open cursor
	open cur1;

	#starts the loop
	the_loop: loop
		#get the values of each column into our variables
		fetch cur1 into v_template_id, v_module_id, v_level_id, v_count;
		if done then
			leave the_loop;
		END if;
		#Do some post processing
			insert into template_question(question_number)(select question_id from question where module_module_id=v_module_id and level_level_id=v_level_id order by rand() limit v_count);
	END loop the_loop;
	close cur1;
	select * from template_question;
END$$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine domo1.random_questions
-- ----------------------------------------------------------------------------
DELIMITER $$

DELIMITER $$
USE `domo1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `random_questions`(IN selected_template int)
BEGIN
	#declare variable
	declare v_template_id, v_module_id, v_level_id, v_count, result, result_list int;
	declare done int default false;

	#declare cursor
	declare cur1 cursor for select template_id,module_id, level_id, count
	from template_module_level
	where template_id = selected_template;

	#declare handle
	declare continue handler for not found set done = true;
	
	#open cursor
	open cur1;

	#starts the loop
	the_loop: loop
		#get the values of each column into our variables
		fetch cur1 into v_template_id, v_module_id, v_level_id, v_count;
		if done then
			leave the_loop;
		END if;
		#Do some post processing
			insert into template_question(templatequestionsetexam_set_exam_id, questions)(select question_id from question where module_module_id=v_module_id and level_level_id=v_level_id order by rand() limit v_count);
	END loop the_loop;
	close cur1;
	select * from template_question;
END$$

DELIMITER ;
SET FOREIGN_KEY_CHECKS = 1;;
