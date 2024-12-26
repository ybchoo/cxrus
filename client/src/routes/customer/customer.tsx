import {
  ActionFunctionArgs, Form, Link,
  LoaderFunctionArgs, useFetcher, useLoaderData,
} from 'react-router-dom'
import { Customer, getCustomer, updateCustomer } 
        from '../../data/Customers'
import {
  QueryClient,
  queryOptions,
  useSuspenseQuery,
} from '@tanstack/react-query'

export const customerDetailQuery = (customerID: string) =>
  queryOptions({
    queryKey: ['customers', customerID],
    queryFn: async () => {
      const customer = await getcustomer(customerID)
      if (!customer) {
        throw new Response('', {
          status: 404,
          statusText: '############# Not Found',
        })
      }
      return customer
    },
  })

export const loader =
  (queryClient: QueryClient) =>
  async ({ params }: LoaderFunctionArgs) => {
    if (!params.customerID) {
      throw new Error('No customer ID provided')
    }
    await queryClient.ensureQueryData(
      customerDetailQuery(params.customerId))
    return { customerID: params.customerID }
  }

export const action =
  (queryClient: QueryClient) =>
  async ({ request, params }: ActionFunctionArgs) => {
    let formData = await request.formData()
    console.log("Form Data   [[["+formData+"]]")
    
    if (!params.customerId) {
      throw new Error('No customer ID provided')
    }
    
    await updatecustomer(params.customerId, {
      favorite: formData.get('favorite') === 'true',
    })
    
    
    await queryClient.invalidateQueries(
       { queryKey: ['customers'] })
    return null
  }

export default function customer() {
  const { customerID } = useLoaderData() as Awaited<
    ReturnType<ReturnType<typeof loader>>
  >
  const { data: customer } = 
     useSuspenseQuery(customerDetailQuery(customerID))

  return (
    <div id="customer">
      <b>Customer Name customer</b><br />
      <b>customer ID</b><br />
      <input placeholder="Enter customer Id"
        aria-label="customer Id" type="text"
        name="customerId" size="60" 
        defaultValue={customer.customerID} /><br />
      { console.dir(customer) }<br />
      <b>Postal Code</b><br />
      <input placeholder="Enter Postal Code"
        aria-label="postalCode" type="text"
        name="postalCode" size="60" 
        defaultValue={customer.postalCode} /><br />
        
      <b>Country</b><br />
      <input placeholder="Country"
        aria-label="Country" type="text"
        name="country" 
        defaultValue={customer.country} /><br />
        
      <b>Customer Name</b><br />
      <input placeholder="Enter Customer Name"
        aria-label="customerName" type="text"
        name="customerName" size="14" 
        defaultValue={customer.customerName} /><br />
      
      <b>Supplier Id</b><br />
      <input placeholder="Enter Contact Name"
        aria-label="contactName" type="text"
        name="contactName" size="16" 
        defaultValue={customer.contactName} /><br />
      
      <b>Address</b><br />
      <input placeholder="Enter Address"
        aria-label="address" type="text"
        name="address" size="20" 
        defaultValue={customer.address} /><br />
        
      <b>City</b><br />
      <input placeholder="Enter City"
        aria-label="city" type="text"
        name="city" size="18" 
        defaultValue={customer.city} /><br />

      <br />
      <span>
        <Link to="edit" className="button">
          Edit
        </Link>
        <Form method="post" action="destroy"
          onSubmit={(event) => {
            // eslint-disable-next-line no-restricted-globals
            if (!confirm('Please confirm you want to delete this record.')) {
              event.preventDefault()
            }
          }}
        >
          <button type="submit">Delete</button>
        </Form>
      </span>
    </div>
  )
}

