export interface Request {
    body?: any;
    query?: { [key: string]: string | string[] };
    params?: { [key: string]: string };
}

export interface Response {
    status: (statusCode: number) => Response;
    json: (data: any) => void;
    send: (data: any) => void;
}