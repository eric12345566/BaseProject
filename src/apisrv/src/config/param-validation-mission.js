import Joi from 'joi';

export default {
    createmission: {
      body: {
        mission_id: Joi.number().required(),
        mission_title: Joi.string().required(),
        mission_level: Joi.number().required(),
        mission_content: Joi.string().required(),
        submission1_content: Joi.string().required(),
        submission2_content: Joi.string().required(),
        submission3_content: Joi.string().required(),
        mission_time: Joi.number().required()
      }
    }
  };
  
  