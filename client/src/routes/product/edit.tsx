import {
  Form,
  useLoaderData,
  redirect,
  useNavigate,
  ActionFunctionArgs,
} from 'react-router-dom'

import { Product, updateProduct } from '../../data/products'
import { QueryClient, useSuspenseQuery } from '@tanstack/react-query'
import { productDetailQuery, loader } from './product'

export const action =
  (queryClient: QueryClient) =>
  async ({ request, params }: ActionFunctionArgs) => {
    const formData = await request.formData()
    console.log("Inside Product Action")
    const updates = Object.fromEntries(formData)
    console.log("Id [[["+params.productId+"]]")
    if (!params.productId) {
      throw new Error('No product ID provided')
    }
    await updateProduct(params.productId, updates)
    queryClient.invalidateQueries({ queryKey: ['products'] })
    return redirect(`/products/${params.productId}`)
  }

export default function Edit() {
  const { productId } = useLoaderData() as Awaited<
    ReturnType<ReturnType<typeof loader>>
  >
  const { data: product } = useSuspenseQuery(productDetailQuery(productId))

  return <ProductForm product={product} />
}

export function ProductForm({ product }: { product?: Product }) {
  const navigate = useNavigate()

  return (
    <Form method="post" id="product-form">
      <b>Product Name Edit</b><br />
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
      
      <p>
        <button type="submit">Save</button>
        <button type="button" onClick={() => {
            navigate(-1)
          }}
        >
          Cancel
        </button>
      </p>
    </Form>
  )
}
