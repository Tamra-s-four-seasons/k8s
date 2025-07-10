-- spmple SQL script --
CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS users (
      userId         VARCHAR(255)      PRIMARY KEY,
      password       VARCHAR(255),
      nickname       VARCHAR(100),
      created_at     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
      updated_at     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP
      ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS complete_table (
   id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'missionId',
   user_id INT NOT NULL COMMENT '해당 미션 수행중인 유저 아이디',
   route_id INT NOT NULL COMMENT '경로 고유아이디',
   started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '미션 시작 시각',
   completed_at TIMESTAMP NULL DEFAULT NULL COMMENT '미션 완료 시각',
   checkpoints JSON NOT NULL COMMENT '체크포인트 배열',
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS in_progress_mission (
   id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'missionId',
   user_id INT NOT NULL COMMENT '해당 미션 수행중인 유저 아이디',
   route_id INT NOT NULL COMMENT '경로 고유아이디',
   started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '미션 시작 시각',
   completed_at TIMESTAMP NULL DEFAULT NULL COMMENT '미션 완료 시각',
   checkpoints JSON NOT NULL COMMENT '체크포인트 배열',
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mission (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'missionId',
    user_id INT NOT NULL COMMENT '해당 미션 수행중인 유저 아이디',
    route_id INT NOT NULL COMMENT '경로 고유아이디',
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '미션 시작 시각',
    completed_at TIMESTAMP NULL DEFAULT NULL COMMENT '미션 완료 시각',
    checkpoints JSON NOT NULL COMMENT '체크포인트 배열',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS in_progress_checkpoints (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mission_id INT NOT NULL COMMENT 'in_progress_table의 id',
    checkpoint_id INT NOT NULL COMMENT '원본 체크포인트 ID',
    name VARCHAR(255) NOT NULL,
    latitude DECIMAL(10, 7) NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,
    address VARCHAR(255),
    description TEXT,
    is_complete BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_mission_id
    FOREIGN KEY (mission_id) REFERENCES in_progress_table(id)
                                                   ON DELETE CASCADE
);

INSERT INTO users (userId, password, nickname) VALUES
    ('admin', 'admin', 'Administrator'),
    ('team1', 'team1', 'Team One'),
    ('team2', 'team2', 'Team Two'),
    ('team3', 'team3', 'Team Three'),
    ('team4', 'team4', 'Team Four'),
    ('team5', 'team5', 'Team Five'),
    ('team6', 'team6', 'Team Six'),
    ('team7', 'team7', 'Team Seven'),
    ('team8', 'team8', 'Team Eight'),
    ('team9', 'team9', 'Team Nine')
ON DUPLICATE KEY UPDATE
    userId = userId;

GRANT ALL PRIVILEGES ON mydb.* TO 'myuser'@'%' IDENTIFIED BY 'mypass123';
FLUSH PRIVILEGES;