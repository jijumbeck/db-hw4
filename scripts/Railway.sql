CREATE TABLE "station" (
  "name" varchar PRIMARY KEY,
  "tracks" varchar UNIQUE,
  "lie_in_city_name" varchar,
  "lie_in_city_region" varchar
);

CREATE TABLE "city" (
  "name" varchar,
  "region" varchar,
  PRIMARY KEY ("name", "region")
);

CREATE TABLE "train" (
  "trainNr" int PRIMARY KEY,
  "length" int,
  "departure_station_name" varchar,
  "arrival_station_name" varchar,
  "start_station_name" varchar,
  "end_station_name" varchar
);

ALTER TABLE "station" ADD FOREIGN KEY ("lie_in_city_name", "lie_in_city_region") REFERENCES "city" ("name", "region");

ALTER TABLE "train" ADD FOREIGN KEY ("departure_station_name") REFERENCES "station" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("arrival_station_name") REFERENCES "station" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("start_station_name") REFERENCES "station" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("end_station_name") REFERENCES "station" ("name");
