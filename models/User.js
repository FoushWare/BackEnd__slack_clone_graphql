import bcrypt from 'bcryptjs';
 export default (sequelize,DataTypes) => {
     const User = sequelize.define('user',{
         username:{
             type:DataTypes.STRING,
             unique:true,
             validate:{
                 isAlphanumeric:{
                     args: true,
                     msg:"The username can Only Contain Letters and Numbers"
                 },
                 len:{

                     args:[3,25],
                     msg:"The Username needs to be betwtween 3 and 25 charactrs long "
                 } 
             }
         },email: {
            type: DataTypes.STRING,
            unique: true,
            validate:{
                isEmail:{
                    args:true,
                    msg:"Invalid email"
                }
            }
          },
          password:
          
          {
            type:DataTypes.STRING,
            validate: {
                 len: {
                       args: [5, 100],
                        msg: 'The password needs to be between 5 and 100 characters long',
                   },
        },

            
            
          },



     },
     
     {
         hooks:{
             afterValidate: async (user) => {
                const hashedPassword = await bcrypt.hash(user.password, 12);
                // eslint-disable-next-line no-param-reassign
                user.password = hashedPassword;
             }
         }
     }
     
     
     
     );
     User.associate = (models)=>{
         // N:M
         User.belongsToMany(models.Team,{
             through:'member',
             foreignKey:{
                 name:'userId',
                 field:'user_id'
             }
         });
         // N:M
      User.belongsToMany(models.Channel, {
        through: 'channel_member',
        foreignKey: {
            name:'userId',
            field:'user_id'
        },
      });
     };

      

     return User;
 }