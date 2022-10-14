CREATE TABLE "StationPersonell" (
  "pers_nr" int PRIMARY KEY,
  "name" varchar UNIQUE,
  "works_for_station_nr" int
);

CREATE TABLE "Caregiver" (
  "is_a_station_personell_nr" int PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "Doctor" (
  "is_a_station_personell_nr" int PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

CREATE TABLE "Patient" (
  "patient_nr" int PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "treats_doctor" int,
  "admission_from" timestamp,
  "admission_to" timestamp,
  "admission_room_nr" int,
  "admission_station_nr" int
);

CREATE TABLE "Station" (
  "station_nr" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "Room" (
  "room_nr" int,
  "beds" int UNIQUE,
  "station_nr" int,
  PRIMARY KEY ("room_nr", "station_nr")
);

ALTER TABLE "StationPersonell" ADD FOREIGN KEY ("works_for_station_nr") REFERENCES "Station" ("station_nr");

ALTER TABLE "Caregiver" ADD FOREIGN KEY ("is_a_station_personell_nr") REFERENCES "StationPersonell" ("pers_nr");

ALTER TABLE "Doctor" ADD FOREIGN KEY ("is_a_station_personell_nr") REFERENCES "StationPersonell" ("pers_nr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("treats_doctor") REFERENCES "Doctor" ("is_a_station_personell_nr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("admission_room_nr", "admission_station_nr") REFERENCES "Room" ("room_nr", "station_nr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("admission_station_nr") REFERENCES "Station" ("station_nr");

ALTER TABLE "Room" ADD FOREIGN KEY ("station_nr") REFERENCES "Station" ("station_nr");
