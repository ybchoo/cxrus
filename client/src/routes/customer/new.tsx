import { redirect, ActionFunctionArgs } from 'react-router-dom'

import { createCustomer } from '../../data/customers'
import { QueryClient } from '@tanstack/react-query'
import { CustomerForm } from './edit'

export const action =
  (queryClient: QueryClient) =>
  async ({ request }: ActionFunctionArgs) => {
  
    const formData = await request.formData()
    const data = Object.fromEntries(formData)
    
    const customer = await createCustomer(data as any)
    queryClient.invalidateQueries(
        { queryKey: ['customers', 'list'] })
    return redirect(`/customers/${customer.customerID}`)
  }

export default function New() {
  return <CustomerForm />
}
