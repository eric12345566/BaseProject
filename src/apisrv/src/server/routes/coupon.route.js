import express from 'express';
import couponCtrl from '../controllers/coupon.controller';
import paramValidation from '../../config/param-validation-mission';
import validate from '../../config/param-validation-mission';

const router = express.Router();

router.route('/')
  .get(couponCtrl.couponGet) /** 取得 User 所有值組 */
  .post(couponCtrl.couponPost); /** 新增 User 值組 */

export default router;
