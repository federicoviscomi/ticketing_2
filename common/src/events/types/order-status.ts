export enum OrderStatus {

    // order created, ticket not reserved
    Created = 'created',

    // ticket could not be reserved or user cancelled order or order expires before payment
    Cancelled = 'cancelled',

    // ticket is reserved
    AwaitingPayment = 'awaiting:payment',

    // ticket is reserved and user paid
    Complete = 'complete'
}