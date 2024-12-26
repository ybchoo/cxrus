import {
 Link,
 NavLink,
 Outlet,
 useLoaderData,
 useNavigation,
 useSubmit,
} from 'react-router-dom'
import { useDebounce } from 'rooks'
import {
 queryOptions,
 useIsFetching,
 useSuspenseQuery,
} from '@tanstack/react-query'
import { getProducts } from '../data/products'
import { getCustomers } from '../data/customers'


import type { QueryClient } from '@tanstack/react-query'

import type { LoaderFunctionArgs } from 'react-router-dom'

const productListQuery = (q?: string) =>
 queryOptions({
  queryKey: ['products', 'list', q ?? 'all'],
  queryFn: () => getProducts(q),
 })
 
const customerListQuery = (q?: string) =>
 queryOptions({
  queryKey: ['customers', 'list', q ?? 'all'],
  queryFn: () => getCustomers(q),
 }) 
 

export const loader =
 (queryClient: QueryClient) =>
 async ({ request }: LoaderFunctionArgs) => {
  const url = new URL(request.url)
  const q = url.searchParams.get('q') ?? ''
  await queryClient.ensureQueryData(productListQuery(q))
  await queryClient.ensureQueryData(customerListQuery(q))
  return { q }
 }

export default function Root() {
 const { q } = useLoaderData() as Awaited<
  ReturnType<ReturnType<typeof loader>>
 >
 const { data: products } = useSuspenseQuery(productListQuery(q))
 const { data: customers } = useSuspenseQuery(customerListQuery(q))
 
 const searching = useIsFetching({ queryKey: ['products', 'list'] }) > 0
 const customersearching = useIsFetching({ queryKey: ['customers', 'list'] }) > 0 
 
 const navigation = useNavigation()
 const submit = useSubmit()

 const debouncedSubmit = useDebounce(submit, 500)

 return (
  <>
   <div id="sidebar">
   
   
    <h2>Products</h2>
    <div>
     <form id="search-form" role="search">
      <input
       id="q"
       aria-label="Search products"
       placeholder="Search"
       type="search"
       name="q"
       key={q}
       autoFocus
       defaultValue={q}
       className={searching ? 'loading' : ''}
       onChange={(event) => {
        debouncedSubmit(event.currentTarget.form)
       }}
      />
      <div id="search-spinner" aria-hidden hidden={!searching} />
      <div className="sr-only" aria-live="polite"></div>
     </form>
     <Link to="products/new" className="button">
      New
     </Link>
    </div>
    
    <nav>
     {products.length ? (
      <ul>
       {products.map((product) => (
        <li key={product.productId}>
         <NavLink to={`products/${product.productId}`}
          className={({ isActive, isPending }) =>
           isActive ? 'active' : isPending ? 'pending' : ''
          }
         >
          {product.product_name ? (
           <>
            {product.product_name}
           </>
          ) : (
           <i>No Product Name</i>
          )}{' '}
          {product.favorite && <span>★</span>}
         </NavLink>
        </li>
       ))}
      </ul>
     ) : (
      <p>
       <i>No products</i>
      </p>
     )}
    </nav>
    
    
   </div>
   <div
    id="detail"
    className={navigation.state === 'loading' ? 'loading' : ''}
   >
    <Outlet />
   </div>
  </>
 )
}
