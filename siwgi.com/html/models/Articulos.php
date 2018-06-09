<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "articulos".
 *
 * @property string $id
 * @property string $idtipo
 * @property string $nombre
 * @property string $precio
 * @property string $marca
 * @property string $modelo
 * @property string $foto
 *
 * @property Categoria $idtipo0
 */
class Articulos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'articulos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['idtipo', 'nombre', 'precio', 'marca', 'modelo'], 'required'],
            [['idtipo'], 'integer'],
            [['nombre', 'precio', 'marca', 'modelo'], 'string'],
            [['foto'], 'string', 'max' => 300],
            [['idtipo'], 'exist', 'skipOnError' => true, 'targetClass' => Categoria::className(), 'targetAttribute' => ['idtipo' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'idtipo' => Yii::t('app', 'Tipo'),
            'nombre' => Yii::t('app', 'Nombre'),
            'precio' => Yii::t('app', 'Precio'),
            'marca' => Yii::t('app', 'Marca'),
            'modelo' => Yii::t('app', 'Modelo'),
            'foto' => Yii::t('app', 'Foto'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdtipo0()
    {
        return $this->hasOne(Categoria::className(), ['id' => 'idtipo']);
    }
}
