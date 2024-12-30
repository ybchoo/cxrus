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
      <h5 className="text-2xl font-bold .text-blue-400">
        New Product
      </h5>
      <div className="mt-12 max-w-md">
        <div className="grid grid-cols-1 gap-6">
          <label className="block">
            <span className="text-gray-700">
              Product ID
            </span>
            <input type="text"
              className="mt-1 block w-full rounded-md border-transparent bg-gray-100 focus:border-gray-500 focus:bg-white focus:ring-0"
               placeholder="" />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Product Name
            </span> 
            <input type="text"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.product_name} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Category ID
            </span> 
            <input type="number" min="1" max="2000"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.categoryid} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Supplier Id
            </span> 
            <input type="number" min="1" max="50"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.supplierId} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Price
            </span> 
            <input type="number" step="0.01" min="1" max="2000"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.price} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Unit In Stock
            </span> 
            <input type="number" 
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.units_in_stock} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Unit On Order
            </span> 
            <input type="number" min="1" max="15"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.units_on_order} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Reorder Level
            </span> 
            <input type="number" min="1" max="15"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100 
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.reorder_level} />
          </label>
          <label className="block">
            <span className="text-gray-700">          
              Discontined
            </span> 
            <input type="number" min="1" max="15"
              className="mt-1 block w-full rounded-md
              border-transparent bg-gray-100
              focus:border-gray-500 focus:bg-white focus:ring-0"
              placeholder="" 
              defaultValue={product?.discontinued} 
              />
          </label>
        </div>
      </div>
      
      <p>
        <button type="submit"
          className="m-4 p-4 border-2 
                     border-black rounded-md
                     mx-10 shadow-lg bg-white
                     ">
          Save
        </button>
        <button type="button" 
          className="m-4 p-4 border-2 border-black rounded-md
                     mx-10 shadow-lg bg-white"
          onClick={() => {
            navigate(-1)
          }}
        >
          Cancel
        </button>
      </p>
    </Form>
  )
}
