-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pseudo" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "avatarUrl" TEXT NOT NULL,
    "birthday" DATETIME NOT NULL,
    "createdAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Event" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "location" TEXT NOT NULL,
    "startAt" DATETIME NOT NULL,
    "endAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "maTableDeLiaison" (
    "userId" INTEGER NOT NULL,
    "eventId" INTEGER NOT NULL,

    PRIMARY KEY ("userId", "eventId"),
    CONSTRAINT "maTableDeLiaison_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "maTableDeLiaison_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_pseudo_key" ON "User"("pseudo");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
