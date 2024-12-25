import { ActionFunctionArgs, redirect } from 'react-router-dom'
import { deleteProduct } from '../data/products'
import { QueryClient } from '@tanstack/react-query'

export const action =
  (queryClient: QueryClient) =>
  async ({ params }: ActionFunctionArgs) => {
    if (!params.productId) {
      throw new Error('No product ID provided')
    }
    await deleteProduct(params.productId)
    queryClient.invalidateQueries({ queryKey: ['products'] })
    return redirect('/')
  }
