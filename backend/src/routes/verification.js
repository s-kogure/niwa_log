import { Router } from 'express';
import { requireAuth } from '../middleware/authenticate.js';
import { asyncHandler } from '../utils/asyncHandler.js';
import { queryAsUser } from '../db.js';

const router = Router();

router.get('/verification', requireAuth, asyncHandler(async (req, res) => {
  const result = await queryAsUser(req.user.id, 'SELECT * FROM users');
  res.json({ status: 'ok', rows: result.rows });
}));

export default router;