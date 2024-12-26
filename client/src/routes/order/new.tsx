import { redirect, ActionFunctionArgs } from 'react-router-dom'

import { createProduct } from '../../data/products'
import { QueryClient } from '@tanstack/react-query'
import { OrderForm } from './edit'

export const action =
  (queryClient: QueryClient) =>
  async ({ request }: ActionFunctionArgs) => {
  
    const formData = await request.formData()
    const data = Object.fromEntries(formData)
    
    const product = await createOrder(data as any)
    queryClient.invalidateQueries(
        { queryKey: ['orders', 'list'] })
    return redirect(`/orders/${order.orderId}`)
  }

export default function New() {
  return <OrderForm />
}
