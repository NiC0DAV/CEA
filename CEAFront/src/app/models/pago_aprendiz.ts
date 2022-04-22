export class pago_aprendiz{
    constructor(
        public id: number,
        public numDocAprendiz: string,
        public fechaPago: any, 
        public pagoActual: string,
        public pagoPendiente: string,
        public pagoTotal: string,
        public facturaElectronica: string
    ){

    }
}