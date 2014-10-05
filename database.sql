CREATE TABLE players (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`rfid` varchar(255) NULL,
	`name` varchar(255) NULL,
	`gender` varchar(6) NULL,
	`uri` varchar(255) NULL,
	`elo` int NOT NULL DEFAULT 0,
	`image` varchar(255) NULL,
	`play_count` int NOT NULL DEFAULT 0,
	`timestamp` DATETIME NULL,
	UNIQUE `PlayerId_UNIQUE` (`id` ASC),
  	INDEX `INX_PlayerId` (`id` ASC),
  	PRIMARY KEY (`id`)
)ENGINE=InnoDB CHARSET=utf8 AUTO_INCREMENT=0;

CREATE TABLE games (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`player0_id` BIGINT NULL,
	`player1_id` BIGINT NULL,
	`start` DATETIME NULL,
	`end` DATETIME NULL,
	`duration` int NULL,
	`player0_score` int NULL,
	`player1_score` int NULL,
	`score_delta` int NULL,
	`winner_id` BIGINT NULL,
	UNIQUE `GamesId_UNIQUE` (`id` ASC),
  	INDEX `INX_GamesId` (`id` ASC),
  	PRIMARY KEY (`id`),
  	CONSTRAINT `FK_Games_Players0_ID` FOREIGN KEY (`player0_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  	CONSTRAINT `FK_Games_Players1_ID` FOREIGN KEY (`player1_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  	CONSTRAINT `FK_Games_Winner_ID` FOREIGN KEY (`winner_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB CHARSET=utf8 AUTO_INCREMENT=0;