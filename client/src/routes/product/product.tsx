import {
  ActionFunctionArgs, Form, Link,
  LoaderFunctionArgs, useFetcher, useLoaderData,
} from 'react-router-dom'
import { Product, getProduct, updateProduct } 
        from '../../data/products'
import {
  QueryClient,
  queryOptions,
  useSuspenseQuery,
} from '@tanstack/react-query'

export const productDetailQuery = (productId: string) =>
  queryOptions({
    queryKey: ['products', productId],
    queryFn: async () => {
      const product = await getProduct(productId)
      if (!product) {
        throw new Response('', {
          status: 404,
          statusText: '############# Not Found',
        })
      }
      return product
    },
  })

export const loader =
  (queryClient: QueryClient) =>
  async ({ params }: LoaderFunctionArgs) => {
    if (!params.productId) {
      throw new Error('No product ID provided')
    }
    await queryClient.ensureQueryData(
      productDetailQuery(params.productId))
    return { productId: params.productId }
  }

export const action =
  (queryClient: QueryClient) =>
  async ({ request, params }: ActionFunctionArgs) => {
    let formData = await request.formData()
    if (!params.productId) {
      throw new Error('No product ID provided')
    }
    await updateProduct(params.productId, {
      favorite: formData.get('favorite') === 'true',
    })
    await queryClient.invalidateQueries(
       { queryKey: ['products'] })
    return null
  }

export default function Product() {
  const { productId } = useLoaderData() as Awaited<
    ReturnType<ReturnType<typeof loader>>
  >
  const { data: product } = 
     useSuspenseQuery(productDetailQuery(productId))

  return (
    <div id="product">
      <div>  
        <b>Product Name Product</b><br />
      <input placeholder="Enter Product Name"
        aria-label="Product Name" type="text"
        name="productName" size="60" 
        defaultValue={product?.productName} /><br />
      <b>Supplier Id</b><br />
      <input placeholder="Enter Supplier Id"
        aria-label="Supplier ID" type="text"
        name="supplierId" 
        defaultValue={product?.supplierId} /><br />
        
      <b>Category Id</b><br />
      <input placeholder=" Enter categoryId"
        aria-label="Category ID" type="text"
        name="categoryId" size="14" 
        defaultValue={product?.categoryId} /><br />
      
      <b>Quantity Per Unit</b><br />
      <input placeholder=" Enter Quantity Per Unit"
        aria-label="Quantity Per Unit" type="text"
        name="quantityPerUnit" size="16" 
        defaultValue={product?.quantityPerUnit} /><br />
      
      <b>Unit Price</b><br />
      <input placeholder=" Enter Unit Price"
        aria-label="unitPrice" type="text"
        name="unitPrice" size="20" 
        defaultValue={product?.unitPrice} /><br />
        
      <b>Units In Stock</b><br />
      <input placeholder="Enter Units In Stock"
        aria-label="unitsInStock" type="text"
        name="unitsInStock" size="18" 
        defaultValue={product?.unitsInStock} /><br />
        
      <b>Units On Order</b><br />
      <input placeholder="Enter Units In Order"
        aria-label="unitsOnOrder" type="text"
        name="unitsOnOrder" size="18" 
        defaultValue={product?.unitsOnOrder} /><br />
      
      <b>Recorder Level</b><br />
      <input placeholder="Enter Reorder Level"
        aria-label="reorderLevel" type="text"
        name="reorderLevel" size="16" 
        defaultValue={product?.reorderLevel} /><br />
      
      <b>Discontinued</b><br />
      <input placeholder="Enter Discontinued"
        aria-label="discontinued" type="text"
        name="discontinued" size="10" 
        defaultValue={product?.discontinued} /><br />
        
        <div>
          <Link to="edit" className="button">
            Edit
          </Link>
          <Form
            method="post"
            action="destroy"
            onSubmit={(event) => {
              // eslint-disable-next-line no-restricted-globals
              if (!confirm('Please confirm you want to delete this record.')) {
                event.preventDefault()
              }
            }}
          > 
            <button type="submit">Delete</button>
          </Form>
        </div>
      </div>
    </div>
  )
}

