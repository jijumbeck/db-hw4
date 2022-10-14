CREATE TABLE "book" (
  "ISBN" varchar PRIMARY KEY,
  "year_book" int,
  "title" varchar,
  "author" varchar,
  "page_count" int
);

CREATE TABLE "instance" (
  "id" varchar,
  "ISBN" varchar,
  "location" int,
  "return_date" timestamp,
  PRIMARY KEY ("id", "ISBN")
);

CREATE TABLE "publisher" (
  "name" varchar PRIMARY KEY,
  "adress" varchar
);

CREATE TABLE "category" (
  "name" varchar PRIMARY KEY,
  "parent_category" varchar
);

CREATE TABLE "reader" (
  "id" varchar PRIMARY KEY,
  "surname" varchar,
  "name" varchar,
  "adress" varchar,
  "birthday" timestamp
);

CREATE TABLE "takes" (
  "reader_id" varchar,
  "instance_id" varchar,
  "return_date" timestamp,
  PRIMARY KEY ("reader_id", "instance_id")
);

ALTER TABLE "instance" ADD CONSTRAINT "instances" FOREIGN KEY ("id") REFERENCES "book" ("ISBN");

ALTER TABLE "instance" ADD FOREIGN KEY ("id") REFERENCES "publisher" ("name");

ALTER TABLE "category" ADD FOREIGN KEY ("name") REFERENCES "book" ("ISBN");

ALTER TABLE "takes" ADD FOREIGN KEY ("reader_id") REFERENCES "reader" ("id");

ALTER TABLE "takes" ADD FOREIGN KEY ("reader_id", "instance_id") REFERENCES "instance" ("id", "ISBN");
