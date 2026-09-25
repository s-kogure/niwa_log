import { Router } from 'express';
import { requireAuth } from '../middleware/authenticate.js';
import { asyncHandler } from '../utils/asyncHandler.js';
import { queryOneAsUser } from '../db.js';

const router = Router();

// 認証〜RLS〜queryOneAsUserの通し確認用。開発環境でのみapp.jsからマウントされる
router.get('/verification', requireAuth, asyncHandler(async (req, res) => {
  // queryOneAsUserは行そのものを返すので .rows は付けない
  const user = await queryOneAsUser(req.user.id, 'SELECT * FROM users');
  res.json({ status: 'ok', user });
}));

export default router;