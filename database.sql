-- Datenbank erstellen
CREATE DATABASE aircraft_forum;
USE aircraft_forum;

-- ✈️ Flugzeuge
CREATE TABLE aircraft (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  manufacturer VARCHAR(100),
  country VARCHAR(100),
  type VARCHAR(50),
  first_flight YEAR,
  max_speed_kmh INT,
  range_km INT,
  crew INT,
  description TEXT
);

-- ⚔️ Waffen (nur Typen)
CREATE TABLE weapons (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  category VARCHAR(50)
);

-- 🔗 Verbindung Flugzeug ↔ Waffen
CREATE TABLE aircraft_weapons (
  aircraft_id INT,
  weapon_id INT,
  PRIMARY KEY (aircraft_id, weapon_id),
  FOREIGN KEY (aircraft_id) REFERENCES aircraft(id),
  FOREIGN KEY (weapon_id) REFERENCES weapons(id)
);

-- 💬 Forum Posts (ohne User-System)
CREATE TABLE posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  aircraft_id INT,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (aircraft_id) REFERENCES aircraft(id)
);

-- 🧪 Beispiel-Daten
INSERT INTO aircraft 
(name, manufacturer, country, type, first_flight, max_speed_kmh, range_km, crew, description)
VALUES
('F-16 Fighting Falcon', 'Lockheed Martin', 'USA', 'Fighter', 1974, 2414, 4220, 1, 'Mehrzweckkampfflugzeug');

INSERT INTO weapons (name, category)
VALUES
('AIM-9 Sidewinder', 'Air-to-Air'),
('M61 Vulcan', 'Cannon');

INSERT INTO aircraft_weapons (aircraft_id, weapon_id)
VALUES (1,1), (1,2);

INSERT INTO posts (aircraft_id, content)
VALUES (1, 'Sehr wendiges Flugzeug und weltweit im Einsatz.');
