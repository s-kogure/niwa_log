import { supabase } from '../supabaseClient.js';
import { ErrorCodes } from '../errorCodes.js';
import { asyncHandler } from '../utils/asyncHandler.js';

const UNAUTHORIZED_MESSAGE = `ログインが必要です。`;

export const requireAuth = asyncHandler(async (req, res, next) => {

  const authHeader = req.headers.authorization;

  if (!authHeader || !authHeader.startsWith('Bearer ')) {

    const err = new Error(UNAUTHORIZED_MESSAGE);
    err.code = ErrorCodes.UNAUTHORIZED.code;
    err.status = ErrorCodes.UNAUTHORIZED.status;
    next(err);

    return;
  }

  const authToken = authHeader.slice('Bearer '.length);
  const { data, error } = await supabase.auth.getUser(authToken);

  if (error || !data.user) {

    const err = new Error(UNAUTHORIZED_MESSAGE);
    err.code = ErrorCodes.UNAUTHORIZED.code;
    err.status = ErrorCodes.UNAUTHORIZED.status;
    next(err);

    return;
  }

  req.user = {
    id: data.user.id,
    email: data.user.email,
  };

  next();

});