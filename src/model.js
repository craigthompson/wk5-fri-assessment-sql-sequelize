import { DataTypes, Model } from "sequelize";
import util from "util";
import connectToDB from "./db.js";

const db = await connectToDB("postgresql:///animals");

export class Human extends Model {
  [util.inspect.custom]() {
    return this.toJSON();
  }

  getFullName() {
    // TODO: Implement this method
  }
}

Human.init({
  human_id: {
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
});

export class Animal extends Model {
  [util.inspect.custom]() {
    return this.toJSON();
  }
}

// TODO: Animal.init()

// TODO: Define Relationship

export default db;
