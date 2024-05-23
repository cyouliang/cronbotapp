'use client'
import { FormEvent } from 'react'
import { usePathname } from 'next/navigation'
import { Button } from "../ui/button";

export default function LoginPage() {
  const pathName = usePathname()
 
  async function handleSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
 
    const formData = new FormData(event.currentTarget)
    const email = formData.get('email')
    const password = formData.get('password')
 
    // const response = await fetch('/api/auth/login', {
    //   method: 'POST',
    //   headers: { 'Content-Type': 'application/json' },
    //   body: JSON.stringify({ email, password }),
    // })
 
    // if (response.ok) {
    //   pathName.push('/profile')
    // } else {
    //   // Handle errors
    // }
  }
 
  return (
    <form onSubmit={handleSubmit}>
      <input type="email" name="email" placeholder="Email" required />
      <input type="password" name="password" placeholder="Password" required />
      <Button className="styles.loginBtn" type="submit">Login</Button>
    </form>
  )
}