import express from 'express';
import missionCtrl from '../controllers/mission.controller';
import paramValidation from '../../config/param-validation-mission';
import validate from  '../../config/param-validation-mission';

const router = express.Router();

router.route('/')
  .get(missionCtrl.missionGet) /** 取得 User 所有值組 */
  .post(missionCtrl.missionPost); /** 新增 User 值組 */

export default router;