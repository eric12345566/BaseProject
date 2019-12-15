// param-validation.js
import Joi from 'joi';

export default {
  createUser: {
    body: {
      name: Joi.string().required(),
      username: Joi.string().required(),
      userpassword: Joi.string().regex(/[a-zA-Z0-9]{6,30}$/).required(),
      email: Joi.string().email().trim().required(),
      gender: Joi.number().min(0).max(1).required()
    }
  }
};
