import express from 'express';
import slotCtrl from '../controllers/slot.controller';

const router = express.Router();

router.route('/').get(slotCtrl.slotGet);

export default router;
