import express from 'express';
import mission_doneCtrl from '../controllers/mission_done.controller';
import paramValidation from '../../config/param-validation-mission';
import validate from  '../../config/param-validation-mission';

const router = express.Router();

router.route('/')
  .get(mission_doneCtrl.mission_doneGet) /** 取得 User 所有值組 */
  .post(mission_doneCtrl.mission_donePost); /** 新增 User 值組 */

export default router;