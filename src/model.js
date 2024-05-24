import { DataTypes, Model } from "sequelize";
import util from "util";
// import url from "url";
import connectToDB from "./db.js";

const db = await connectToDB("postgresql:///animals");

export class Human extends Model {
  [util.inspect.custom]() {
    return this.toJSON();
  }

  /**
   * Should return the human’s first and last name, separated by
   * a space.
   * @returns as string of the first and last name
   */
  getFullName() {
    return `${Human.fname} ${Human.lname}`;
  }
}

Human.init(
  {
    humanId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    fname: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    lname: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
  },
  {
    modelName: "Human",
    sequelize: db,
  }
);

export class Animal extends Model {
  [util.inspect.custom]() {
    return this.toJSON();
  }
}

Animal.init(
  {
    animalId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    species: {
      type: DataTypes.STRING(25),
      allowNull: false,
    },
    birthYear: {
      type: DataTypes.INTEGER,
    },
  },
  {
    modelName: "Animal",
    sequelize: db,
  }
);

// Model Relationships
Human.hasMany(Animal, { foreignKey: "humanId" });
Animal.belongsTo(Human, { foreignKey: "humanId" }); // TODO: This may need a foreignKey of "animal_id"

// TODO: Get rid of following if not needed
// if (process.argv[1] === url.fileURLToPath(import.meta.url)) {
//   console.log("Syncing DB...");
//   await db.sync({ alter: true });
//   console.log("Finished syncing DB.");
// }

export default db;
