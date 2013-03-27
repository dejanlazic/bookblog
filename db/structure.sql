CREATE TABLE "authors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(255), "last_name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "authors_books" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "author_id" integer, "book_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "books" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "genre_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "author_id" integer NOT NULL);
CREATE TABLE "genres" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130306134639');

INSERT INTO schema_migrations (version) VALUES ('20130306134727');

INSERT INTO schema_migrations (version) VALUES ('20130311130752');

INSERT INTO schema_migrations (version) VALUES ('20130324184620');