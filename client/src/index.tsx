import * as React from 'react'
import * as ReactDOM from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { ReactQueryDevtools } from '@tanstack/react-query-devtools'

import './index.css'

import ErrorPage from './error-page'
import Root, { loader as rootLoader } from './routes/root'
import Product, {
  loader as contactLoader,
  action as contactAction,
} from './routes/product/product'
import EditProduct, { action as editAction } from './routes/product/edit'
import NewProduct, { action as newAction } from './routes/product/new'


import Customer, {
  loader as customerLoader,
  action as customerAction,
} from './routes/customer/customer'
import EditCustomer, { action as editAction } from './routes/customer/edit'
import NewCustomer, { action as newAction } from './routes/customer/new'

import { action as destroyAction } from './routes/destroy'
import Index from './routes/index'

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 1000 * 10,
    },
  },
})

const router = createBrowserRouter([
  {
    path: '/',
    element: <Root />,
    errorElement: <ErrorPage />,
    loader: rootLoader(queryClient),
    children: [
      {
        index: true,
        element: <Index />,
      },
      {
        path: 'products/new',
        element: <NewProduct />,
        action: newAction(queryClient),
        errorElement: <ErrorPage />,
      },
      {
        path: 'products/:productId',
        element: <Product />,
        loader: contactLoader(queryClient),
        action: contactAction(queryClient),
        errorElement: <ErrorPage />,
      },
      {
        path: 'products/:productId/edit',
        element: <EditProduct />,
        loader: contactLoader(queryClient),
        action: editAction(queryClient),
        errorElement: <ErrorPage />,
      },
      {
        path: 'products/:productId/destroy',
        element: <EditProduct />,
        action: destroyAction(queryClient),
        errorElement: <ErrorPage />,
      },
    ],
  },
])

const rootElement = document.getElementById('root')
ReactDOM.createRoot(rootElement!).render(
  <React.StrictMode>
    
    <QueryClientProvider client={queryClient}>
       <RouterProvider router={router} />
       <ReactQueryDevtools buttonPosition="bottom-right" />
    </QueryClientProvider>
  </React.StrictMode>,
)
