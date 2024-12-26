import { redirect, ActionFunctionArgs } from 'react-router-dom'

import { createProduct } from '../../data/products'
import { QueryClient } from '@tanstack/react-query'
import { ProductForm } from './edit'

export const action =
  (queryClient: QueryClient) =>
  async ({ request }: ActionFunctionArgs) => {
  
    const formData = await request.formData()
    const data = Object.fromEntries(formData)
    
    const product = await createProduct(data as any)
    queryClient.invalidateQueries(
        { queryKey: ['products', 'list'] })
    return redirect(`/products/${product.productId}`)
  }

export default function New() {
  return <ProductForm />
}
