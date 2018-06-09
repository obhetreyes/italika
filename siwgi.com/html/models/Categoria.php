<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "categoria".
 *
 * @property string $id
 * @property string $tipo
 *
 * @property Articulos[] $articulos
 */
class Categoria extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'categoria';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tipo'], 'required'],
            [['tipo'], 'string'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'tipo' => Yii::t('app', 'Tipo'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getArticulos()
    {
        return $this->hasMany(Articulos::className(), ['idtipo' => 'id']);
    }
    public static function getAll(){
        $categoria[] = 'Seleccione una categoria';
        foreach (Categoria::find()->all() as $registro){
            $categoria[$registro->id] = $registro->tipo;
        }
        return $categoria;
        }
}
