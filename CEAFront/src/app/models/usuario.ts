export class usuario{
    constructor(
        public id: number,
        public userId: string,
        public tipo_documento: string, 
        public nombres: string,
        public apellidos: string,
        public direccion: string,
        public correo_electronico: string,
        public telefono: string,
        public celular: string, 
        public tipo_Usuario: string,
        public contrasena: string,
        public huella: any,
        public ultima_act: string
    ){

    }
}