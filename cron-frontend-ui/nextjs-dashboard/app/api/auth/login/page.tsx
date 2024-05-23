import { NextApiRequest, NextApiResponse } from 'next'
import { signIn } from 'next-auth/react'

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  try {
    const { email, password } = req.body
    await signIn('credentials', { email, password })
 
    res.status(200).json({ success: true })
  } catch (error) {
    if (error instanceof Error && error.name === 'CredentialsSignin') {
      res.status(401).json({ error: 'Invalid credentials.' })
    } else {
      res.status(500).json({ error: 'Something went wrong.' })
    }
  }
}