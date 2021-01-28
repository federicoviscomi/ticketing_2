import {CustomError} from "./custom-error";

export class NotFoundError extends CustomError {
    statusCode: number;

    constructor() {
        super('Not found');
        this.statusCode = 404;
        Object.setPrototypeOf(this, NotFoundError.prototype);
    }

    serializeErrors(): { message: string; field?: string }[] {
        return [{message: 'Not found'}];
    }
}