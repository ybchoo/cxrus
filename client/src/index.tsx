import * as React from 'react'
import ReactDOM from 'react-dom/client'
import { QueryClient, useQuery, useQueryClient } from '@tanstack/react-query'
import { PersistQueryClientProvider } from '@tanstack/react-query-persist-client'
import { createSyncStoragePersister } from '@tanstack/query-sync-storage-persister'
import { ReactQueryDevtools } from '@tanstack/react-query-devtools'

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      gcTime: 1000 * 60 * 60 * 24, // 24 hours
    },
  },
})

const persister = createSyncStoragePersister({
  storage: window.localStorage,
})

type TopTenCustomer = {
  startDate: date
  endDate: date
  body: string
}

function useTopTenCustomers() {
  return useQuery({
    queryKey: ['tentop'],
    queryFn: async (): Promise<Array<Post>> => {
      const response = await fetch('http://localhost:8080/toptencustomers')
      return await response.json()
    },
  })
}

function TopTenCustomers({
  setPostId,
}: {
  setPostId: React.Dispatch<React.SetStateAction<number>>
}) {
  const queryClient = useQueryClient()
  const { status, data, error, isFetching } = useTopTenCustomers()

  return (
    <div>
      <h1>Top Ten Customers</h1>
      <div>
        {status === 'pending' ? (
          'Loading...'
        ) : status === 'error' ? (
          <span>Error: {error.message}</span>
        ) : (
          <>
            <div>
              {data.map((tentop) => (
                <p key={tentop.startDate}>
                </p>
              ))}
            </div>
            <div>{isFetching ? 'Background Updating...' : ' '}</div>
          </>
        )}
      </div>
    </div>
  )
}



const rootElement = document.getElementById('root') as HTMLElement
ReactDOM.createRoot(rootElement).render(<App />)
