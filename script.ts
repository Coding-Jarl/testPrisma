const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  // CREATION
  //   const user = await prisma.user.create({
  //     data: {
  //       pseudo: "Alice2",
  //       email: "alice2@prisma.io",
  //       avatarUrl: "",
  //       birthday: new Date("1970-01-01"),
  //       createdAt: new Date(),
  //       password: "",
  //     },
  //   });
  //   console.log(user);
  //
  // LIST
  const users = await prisma.user.findMany({
    include: {
      events: true,
    },
  });
  console.dir(users, { depth: null });

  //
  // CREATION WITH LINKED ENTITIES
  //   const user = await prisma.user.create({
  //     data: {
  //       pseudo: "Alice3",
  //       email: "alice3@prisma.io",
  //       avatarUrl: "",
  //       birthday: new Date("1970-01-01"),
  //       createdAt: new Date(),
  //       password: "",
  //       events: {
  //         create: {
  //           event: {
  //             create: {
  //               location: "Chez VCode",
  //               startAt: new Date("2023-03-08T23:00:00.000Z"),
  //               endAt: new Date("2023-03-09T00:00:00.000Z"),
  //             },
  //           },
  //         },
  //       },
  //     },
  //   });
  //   console.log(user);
  //   const events = await prisma.event.findMany();
  //   console.log(events);
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
